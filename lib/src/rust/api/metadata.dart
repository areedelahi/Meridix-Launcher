

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<List<VanillaVersion>> getVanillaVersions() =>
    RustLib.instance.api.crateApiMetadataGetVanillaVersions();

Future<List<String>> getFabricLoaders() =>
    RustLib.instance.api.crateApiMetadataGetFabricLoaders();

Future<List<String>> getQuiltLoaders() =>
    RustLib.instance.api.crateApiMetadataGetQuiltLoaders();

Future<List<String>> getForgeVersions() =>
    RustLib.instance.api.crateApiMetadataGetForgeVersions();

Future<List<String>> getNeoforgeVersions() =>
    RustLib.instance.api.crateApiMetadataGetNeoforgeVersions();

class VanillaVersion {
  final String id;
  final String versionType;

  const VanillaVersion({
    required this.id,
    required this.versionType,
  });

  @override
  int get hashCode => id.hashCode ^ versionType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VanillaVersion &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          versionType == other.versionType;
}
