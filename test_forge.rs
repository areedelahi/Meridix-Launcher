use std::error::Error;

fn main() -> Result<(), Box<dyn Error>> {
    let xml = reqwest::blocking::get("https://maven.minecraftforge.net/net/minecraftforge/forge/maven-metadata.xml")?.text()?;
    
    let latest = capture_one(&xml, r"<latest>(.*?)</latest>", "latest")?;
    println!("Latest: {}", latest);
    let release = capture_one(&xml, r"<release>(.*?)</release>", "release")?;
    println!("Release: {}", release);
    Ok(())
}

fn capture_one(xml: &str, pattern: &str, field: &str) -> Result<String, Box<dyn Error>> {
    let re = regex::Regex::new(pattern)?;
    let captures = re.captures(xml).ok_or_else(|| {
        format!("Missing <{}> tag in maven-metadata.xml", field)
    })?;
    Ok(captures.get(1).unwrap().as_str().to_string())
}
