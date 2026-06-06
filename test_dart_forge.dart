import 'package:dio/dio.dart';

void main() async {
  try {
    final dio = Dio();
    final response = await dio.get("https://maven.minecraftforge.net/net/minecraftforge/forge/maven-metadata.xml");
    print("Length: ${response.data.length}");
  } catch(e) {
    print(e);
  }
}
