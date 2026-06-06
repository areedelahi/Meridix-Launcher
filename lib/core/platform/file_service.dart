import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

/// Cross-platform file system paths for the launcher.
abstract class FileService {
  /// Root launcher data directory (e.g. ~/.liquid_launcher)
  Future<Directory> get launcherDir;

  /// Instances root directory
  Future<Directory> get instancesDir;

  /// Shared assets cache (.minecraft/assets style)
  Future<Directory> get assetsDir;

  /// Shared libraries cache
  Future<Directory> get librariesDir;

  /// JRE installations directory
  Future<Directory> get jreDir;

  /// Temporary natives extraction directory
  Future<Directory> nativesDir(String instanceId);

  /// Crash reports directory for an instance
  Future<Directory> crashReportsDir(String instanceId);

  /// Per-instance .minecraft directory
  Future<Directory> instanceGameDir(String instanceId);

  /// Ensure a directory exists and return it
  Future<Directory> ensure(Directory dir);
}

class DesktopFileService implements FileService {
  Directory? _launcherDirCache;

  @override
  Future<Directory> get launcherDir async {
    if (_launcherDirCache != null) return _launcherDirCache!;
    
    final prefs = await SharedPreferences.getInstance();
    final customDir = prefs.getString('customDataDirectory');
    if (customDir != null && customDir.isNotEmpty) {
      _launcherDirCache = await ensure(Directory(customDir));
      return _launcherDirCache!;
    }
    
    final appSupport = await getApplicationSupportDirectory();
    final dir = Directory(p.join(appSupport.path, 'MeridixLauncher'));
    _launcherDirCache = await ensure(dir);
    return _launcherDirCache!;
  }

  @override
  Future<Directory> get instancesDir async {
    final root = await launcherDir;
    return ensure(Directory(p.join(root.path, 'instances')));
  }

  @override
  Future<Directory> get assetsDir async {
    final root = await launcherDir;
    return ensure(Directory(p.join(root.path, 'assets')));
  }

  @override
  Future<Directory> get librariesDir async {
    final root = await launcherDir;
    return ensure(Directory(p.join(root.path, 'libraries')));
  }

  @override
  Future<Directory> get jreDir async {
    final root = await launcherDir;
    return ensure(Directory(p.join(root.path, 'jre')));
  }

  @override
  Future<Directory> nativesDir(String instanceId) async {
    final temp = await getTemporaryDirectory();
    return ensure(Directory(p.join(temp.path, 'liquid_natives', instanceId)));
  }

  @override
  Future<Directory> crashReportsDir(String instanceId) async {
    final gameDir = await instanceGameDir(instanceId);
    return ensure(Directory(p.join(gameDir.path, 'crash-reports')));
  }

  @override
  Future<Directory> instanceGameDir(String instanceId) async {
    final instances = await instancesDir;
    return ensure(Directory(p.join(instances.path, instanceId, '.minecraft')));
  }

  @override
  Future<Directory> ensure(Directory dir) async {
    if (!dir.existsSync()) await dir.create(recursive: true);
    return dir;
  }

  /// Resolve the current platform's native classifier string.
  static String get nativesClassifier {
    if (Platform.isWindows) return 'natives-windows';
    if (Platform.isMacOS) return 'natives-osx';
    return 'natives-linux';
  }

  /// Resolve OS string used by Mojang rules.
  static String get mojangOs {
    if (Platform.isWindows) return 'windows';
    if (Platform.isMacOS) return 'osx';
    return 'linux';
  }

  /// Resolve arch string for JRE provisioning.
  static String get arch {
    final machine = Platform.version;
    if (machine.contains('arm64') || machine.contains('aarch64'))
      return 'aarch64';
    return 'x64';
  }
}
