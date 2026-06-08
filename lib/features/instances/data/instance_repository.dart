import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as p;
import '../../../core/platform/file_service.dart';
import '../domain/models/instance.dart';

final instanceRepositoryProvider = Provider<InstanceRepository>((ref) {
  return InstanceRepository();
});

class InstanceRepository {
  Future<Directory> get _instancesDir async {
    final prefs = await SharedPreferences.getInstance();
    final customDir = prefs.getString('customDataDirectory');
    Directory baseDir;
    if (customDir != null && customDir.isNotEmpty) {
      baseDir = Directory(customDir);
    } else {
      baseDir = await getMeridixSupportDirectory();
    }
    
    final dir = Directory(p.join(baseDir.path, 'instances'));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  /// Get the exact path to an instance directory by its ID
  Future<String> getInstancePath(String id) async {
    final dir = await _instancesDir;
    return p.join(dir.path, id);
  }

  /// Get the root launcher directory
  Future<String> getLauncherRoot() async {
    final dir = await _instancesDir;
    return dir.parent.path;
  }

  /// List all instances saved in the instances directory
  Future<List<Instance>> getInstances() async {
    final dir = await _instancesDir;
    final List<Instance> instances = [];

    await for (final entity in dir.list()) {
      if (entity is Directory) {
        final instanceFile = File(p.join(entity.path, 'instance.json'));
        if (await instanceFile.exists()) {
          try {
            final content = await instanceFile.readAsString();
            final json = jsonDecode(content) as Map<String, dynamic>;
            instances.add(Instance.fromJson(json));
          } catch (e) {
            print('Failed to read instance at ${entity.path}: $e');
          }
        }
      }
    }
    return instances;
  }

  /// Saves or updates an instance configuration to disk
  Future<void> saveInstance(Instance instance) async {
    final dir = await _instancesDir;
    final instanceDir = Directory(p.join(dir.path, instance.id));
    if (!await instanceDir.exists()) {
      await instanceDir.create(recursive: true);

      // Also create standard Minecraft folders for convenience
      await Directory(p.join(instanceDir.path, 'mods')).create();
      await Directory(p.join(instanceDir.path, 'resourcepacks')).create();
      await Directory(p.join(instanceDir.path, 'shaderpacks')).create();
      await Directory(p.join(instanceDir.path, 'saves')).create();
      await Directory(p.join(instanceDir.path, 'screenshots')).create();
    }

    final instanceFile = File(p.join(instanceDir.path, 'instance.json'));
    // Use jsonEncode with pretty print so users can manually edit it easily
    const encoder = JsonEncoder.withIndent('  ');
    final jsonString = encoder.convert(instance.toJson());
    await instanceFile.writeAsString(jsonString);
  }

  /// Deletes an instance folder completely
  Future<void> deleteInstance(String id) async {
    final dir = await _instancesDir;
    final instanceDir = Directory(p.join(dir.path, id));
    if (await instanceDir.exists()) {
      await instanceDir.delete(recursive: true);
    }
  }
}
