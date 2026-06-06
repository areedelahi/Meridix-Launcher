import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final vanillaIconUrlProvider = FutureProvider<String>((ref) async {
  final dio = Dio();
  
  try {
    // Step A: Request the global version manifest from the official endpoint
    final manifestResp = await dio.get('https://launchermeta.mojang.com/mc/game/version_manifest_v2.json');
    final versions = manifestResp.data['versions'] as List;
    
    // Step B: Parse that JSON file to find the URL for the specific game version
    final latestReleaseId = manifestResp.data['latest']['release'] as String;
    final latestRelease = versions.firstWhere((v) => v['id'] == latestReleaseId);
    
    // Step C: Inside that version's JSON, locate the assetIndex URL
    final versionResp = await dio.get(latestRelease['url'] as String);
    final assetIndexUrl = versionResp.data['assetIndex']['url'] as String;
    
    // Fetch asset index which points to the complete list of game assets
    final assetsResp = await dio.get(assetIndexUrl);
    final objects = assetsResp.data['objects'] as Map<String, dynamic>;
    
    // Find icon hash
    final iconObject = objects['icons/icon_128x128.png'] ?? objects['icons/icon_256x256.png'] ?? objects['minecraft/icons/minecraft.icns'];
    if (iconObject == null) {
      throw Exception('Could not find icon in asset index');
    }
    
    final hash = iconObject['hash'] as String;
    final prefix = hash.substring(0, 2);
    
    // Step D: Return URL for direct download from Mojang's CDN
    return 'https://resources.download.minecraft.net/$prefix/$hash';
  } catch (e) {
    // Fallback if network or parsing fails
    return 'https://upload.wikimedia.org/wikipedia/en/5/51/Minecraft_cover.png';
  }
});
