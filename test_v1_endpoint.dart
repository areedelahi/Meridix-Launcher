import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();
  try {
    final resp = await dio.post<Map<String, dynamic>>(
      'https://login.live.com/oauth20_token.srf',
      data: {
        'client_id': '00000000402b5328',
        'grant_type': 'authorization_code',
        'code': 'DUMMY_CODE',
        'redirect_uri': 'https://login.live.com/oauth20_desktop.srf',
        'scope': 'service::user.auth.xboxlive.com::MBI_SSL',
      },
      options: Options(
        contentType: 'application/x-www-form-urlencoded',
        validateStatus: (s) => true,
      ),
    );
    print(resp.statusCode);
    print(resp.data);
  } catch (e) {
    print(e);
  }
}
