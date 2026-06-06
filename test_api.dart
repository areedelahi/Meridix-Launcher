import 'dart:convert';
import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();
  try {
    final response = await dio.get('https://api.modrinth.com/v2/project/fabulously-optimized/version', queryParameters: {
      'game_versions': jsonEncode(["1.21.1"]),
      'loaders': jsonEncode(["fabric"])
    });
    print(response.data);
  } catch(e) {
    print(e);
  }
}
