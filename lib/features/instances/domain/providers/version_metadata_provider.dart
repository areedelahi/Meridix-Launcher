import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_launcher/src/rust/api/metadata.dart';
import 'package:dio/dio.dart';

/// Provider for fetching the list of all vanilla Minecraft versions from Mojang.
final vanillaVersionsProvider = FutureProvider<List<VanillaVersion>>((ref) async {
  return await getVanillaVersions();
});

/// Provider for fetching the list of all Fabric loader versions.
final fabricLoadersProvider = FutureProvider<List<String>>((ref) async {
  return await getFabricLoaders();
});

/// Provider for fetching the list of all Forge loader versions.
final forgeLoadersProvider = FutureProvider<List<String>>((ref) async {
  try {
    return await getForgeVersions();
  } catch (e) {
    print("Rust forge fetch failed, falling back to Dart: $e");
    final dio = Dio();
    // Forge's cloudflare might block Rust's reqwest from Flutter macOS sandbox but Dart's Dio works!
    final response = await dio.get("https://maven.minecraftforge.net/net/minecraftforge/forge/maven-metadata.xml");
    final xml = response.data as String;
    final regex = RegExp(r"<version>(.*?)</version>");
    final versions = regex.allMatches(xml).map((m) => m.group(1)!).toList();
    return versions.reversed.toList(); // Return latest first
  }
});

/// Provider for fetching the list of all NeoForge loader versions.
final neoForgeLoadersProvider = FutureProvider<List<String>>((ref) async {
  return await getNeoforgeVersions();
});

/// Provider for fetching the list of all Quilt loader versions.
final quiltLoadersProvider = FutureProvider<List<String>>((ref) async {
  return await getQuiltLoaders();
});
