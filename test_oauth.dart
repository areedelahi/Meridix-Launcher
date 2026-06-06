import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();
  try {
    final authUrl = Uri.https(
      'login.microsoftonline.com',
      '/consumers/oauth2/v2.0/authorize',
      {
        'client_id': '00000000402b5328',
        'response_type': 'code',
        'redirect_uri': 'http://localhost:5555',
        'scope': 'XboxLive.signin offline_access',
      },
    );
    final resp = await dio.get(authUrl.toString(),
        options: Options(
          followRedirects: false,
          validateStatus: (s) => true,
        ));
    print(resp.statusCode);
    print(resp.headers.value('location'));
  } catch (e) {
    print(e);
  }
}
