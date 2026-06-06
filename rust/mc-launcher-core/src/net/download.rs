//! Download plans and execution.

use std::{
    fs::{self, File},
    io,
    path::PathBuf,
};

use crate::{
    io::hash::sha1_file,
    progress::{ProgressEvent, ProgressReporter, SkipReason},
    LauncherError, Result,
};

/// Supported checksum validation methods for downloaded files.
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Checksum {
    /// SHA-1 checksum.
    Sha1(String),
    /// SHA-256 checksum.
    Sha256(String),
}

/// One file download.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct DownloadTask {
    /// Source URL.
    pub url: String,
    /// Destination path.
    pub destination: PathBuf,
    /// Optional checksum used for skip and validation decisions.
    pub checksum: Option<Checksum>,
    /// Human-readable task label reported in progress events.
    pub label: String,
}

/// A batch of download tasks.
#[derive(Debug, Clone, Default, PartialEq, Eq)]
pub struct DownloadPlan {
    /// Tasks to execute in order.
    pub tasks: Vec<DownloadTask>,
}

/// Returns whether an existing destination file can be reused.
///
/// # Errors
///
/// Returns [`crate::LauncherError`] if checksum calculation fails.
pub fn should_skip_existing(task: &DownloadTask) -> Result<bool> {
    if !task.destination.is_file() {
        return Ok(false);
    }

    match &task.checksum {
        Some(Checksum::Sha1(expected)) => Ok(sha1_file(&task.destination)? == *expected),
        Some(Checksum::Sha256(_)) => Ok(false),
        None => Ok(true),
    }
}

/// Executes a download plan in order.
///
/// Existing files with matching checksums are skipped. Each completed SHA-1
/// download is verified before the next task begins.
///
/// # Errors
///
/// Returns [`crate::LauncherError`] for network, filesystem, or checksum
/// failures.
/// Executes a download plan sequentially in order.
/// This is the safe fallback method.
pub fn execute_plan_sequential(plan: &DownloadPlan, reporter: &mut dyn ProgressReporter) -> Result<()> {
    let client = super::http::client()?;
    for task in &plan.tasks {
        if should_skip_existing(task)? {
            reporter.report(ProgressEvent::TaskSkipped {
                label: task.label.clone(),
                reason: if task.checksum.is_some() {
                    SkipReason::ChecksumMatched
                } else {
                    SkipReason::FileExistsWithoutChecksum
                },
            });
            continue;
        }

        reporter.report(ProgressEvent::TaskStarted {
            label: task.label.clone(),
            path: task.destination.clone(),
        });

        if let Some(parent) = task.destination.parent() {
            fs::create_dir_all(parent)?;
        }
        let mut response = client.get(&task.url).send()?.error_for_status()?;
        let total = response.content_length();
        let mut file = File::create(&task.destination)?;
        let mut received = 0;
        let mut buffer = [0; 8192];
        loop {
            let n = std::io::Read::read(&mut response, &mut buffer)?;
            if n == 0 {
                break;
            }
            std::io::Write::write_all(&mut file, &buffer[..n])?;
            received += n as u64;
            reporter.report(ProgressEvent::BytesReceived {
                label: task.label.clone(),
                received,
                total,
            });
        }

        if let Some(Checksum::Sha1(expected)) = &task.checksum {
            let actual = sha1_file(&task.destination)?;
            if actual != *expected {
                return Err(LauncherError::ChecksumMismatch {
                    path: task.destination.clone(),
                    expected: expected.clone(),
                    actual,
                });
            }
        }

        reporter.report(ProgressEvent::TaskFinished {
            label: task.label.clone(),
        });
    }
    Ok(())
}

/// Executes a download plan concurrently using a thread pool.
///
/// Existing files with matching checksums are skipped. Each completed SHA-1
/// download is verified.
///
/// # Errors
///
/// Returns [`crate::LauncherError`] for network, filesystem, or checksum
/// failures.
pub fn execute_plan(plan: &DownloadPlan, reporter: &mut dyn ProgressReporter) -> Result<()> {
    // If there are only a few tasks, just run sequentially to avoid overhead
    if plan.tasks.len() <= 1 {
        return execute_plan_sequential(plan, reporter);
    }

    use std::sync::{mpsc, Arc, Mutex};
    use std::thread;

    let num_threads = std::cmp::min(8, plan.tasks.len());
    let (tx, rx) = mpsc::channel();
    
    // We clone the tasks to share them across threads via a thread-safe iterator
    let tasks: Vec<DownloadTask> = plan.tasks.clone();
    let task_queue = Arc::new(Mutex::new(tasks.into_iter()));
    
    let mut handles = Vec::new();

    for _ in 0..num_threads {
        let task_queue = Arc::clone(&task_queue);
        let tx = tx.clone();
        
        handles.push(thread::spawn(move || {
            let client = match super::http::client() {
                Ok(c) => c,
                Err(e) => {
                    let _ = tx.send(Err(e));
                    return;
                }
            };
            
            loop {
                // Fetch the next task from the shared queue
                let task_opt = {
                    let mut q = task_queue.lock().unwrap();
                    q.next()
                };
                
                let Some(task) = task_opt else { break; };
                
                match should_skip_existing(&task) {
                    Ok(true) => {
                        let reason = if task.checksum.is_some() {
                            SkipReason::ChecksumMatched
                        } else {
                            SkipReason::FileExistsWithoutChecksum
                        };
                        let _ = tx.send(Ok(ProgressEvent::TaskSkipped {
                            label: task.label.clone(),
                            reason,
                        }));
                        continue;
                    }
                    Ok(false) => {}
                    Err(e) => {
                        let _ = tx.send(Err(e));
                        return;
                    }
                }
                
                let _ = tx.send(Ok(ProgressEvent::TaskStarted {
                    label: task.label.clone(),
                    path: task.destination.clone(),
                }));
                
                if let Some(parent) = task.destination.parent() {
                    if let Err(e) = fs::create_dir_all(parent) {
                        let _ = tx.send(Err(e.into()));
                        return;
                    }
                }
                
                let response_res = client.get(&task.url).send().and_then(|r| r.error_for_status());
                let mut response = match response_res {
                    Ok(r) => r,
                    Err(e) => {
                        let _ = tx.send(Err(e.into()));
                        return;
                    }
                };
                
                let total = response.content_length();
                let mut file = match File::create(&task.destination) {
                    Ok(f) => f,
                    Err(e) => {
                        let _ = tx.send(Err(e.into()));
                        return;
                    }
                };
                
                let mut received = 0;
                let mut buffer = [0; 8192];
                loop {
                    match std::io::Read::read(&mut response, &mut buffer) {
                        Ok(0) => break,
                        Ok(n) => {
                            if let Err(e) = std::io::Write::write_all(&mut file, &buffer[..n]) {
                                let _ = tx.send(Err(e.into()));
                                return;
                            }
                            received += n as u64;
                            let _ = tx.send(Ok(ProgressEvent::BytesReceived {
                                label: task.label.clone(),
                                received,
                                total,
                            }));
                        }
                        Err(e) => {
                            let _ = tx.send(Err(e.into()));
                            return;
                        }
                    }
                }
                
                if let Some(Checksum::Sha1(expected)) = &task.checksum {
                    match sha1_file(&task.destination) {
                        Ok(actual) => {
                            if actual != *expected {
                                let _ = tx.send(Err(LauncherError::ChecksumMismatch {
                                    path: task.destination.clone(),
                                    expected: expected.clone(),
                                    actual,
                                }));
                                return;
                            }
                        }
                        Err(e) => {
                            let _ = tx.send(Err(e));
                            return;
                        }
                    }
                }
                
                let _ = tx.send(Ok(ProgressEvent::TaskFinished {
                    label: task.label.clone(),
                }));
            }
        }));
    }
    
    // Drop the main thread's sender so the receiver iter stops when the workers finish
    drop(tx);
    
    // Process progress events on the main thread safely
    for msg in rx {
        match msg {
            Ok(event) => reporter.report(event),
            Err(e) => return Err(e),
        }
    }
    
    // Wait for all worker threads
    for handle in handles {
        let _ = handle.join();
    }
    
    Ok(())
}
