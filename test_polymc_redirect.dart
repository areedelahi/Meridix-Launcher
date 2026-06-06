import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();
  final authUrl = Uri.https(
    'login.microsoftonline.com',
    '/consumers/oauth2/v2.0/authorize',
    {
      'client_id': '14fec649-80fb-4811-9a7c-bc244a50d2bb',
      'response_type': 'code',
      'redirect_uri': 'https://login.live.com/oauth20_desktop.srf',
      'scope': 'XboxLive.signin offline_access',
    },
  );
  try {
    final resp = await dio.get(authUrl.toString());
    if (resp.data.toString().contains('is not valid')) {
      print('Invalid Redirect');
    } else {
      print('SUCCESS!');
    }
  } catch (e) {
    print(e);
  }
}
