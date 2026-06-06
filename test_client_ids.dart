import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();
  final ids = [
    'b7c69ec6-8c43-41a4-b0ec-68097f4db239', // Prism Launcher?
    '14fec649-80fb-4811-9a7c-bc244a50d2bb', // PolyMC
    'e8c4e4d5-5026-4078-a87d-8ebef6cba394', // Another one?
    '00000000402b5328', // Official
  ];

  for (var id in ids) {
    try {
      final authUrl = Uri.https(
        'login.microsoftonline.com',
        '/consumers/oauth2/v2.0/authorize',
        {
          'client_id': id,
          'response_type': 'code',
          'redirect_uri': 'http://localhost:5555',
          'scope': 'XboxLive.signin offline_access',
        },
      );
      final resp = await dio.get(authUrl.toString());
      if (resp.data.toString().contains('is not valid')) {
        print('$id -> Invalid Redirect');
      } else {
        print('$id -> SUCCESS!');
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.data.toString().contains('is not valid') == true) {
          print('$id -> Invalid Redirect');
        } else {
          print('$id -> Failed with ${e.response?.statusCode}');
        }
      } else {
        print('$id -> $e');
      }
    }
  }
}
