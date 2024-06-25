import 'package:dio/dio.dart';

class AuthService {
  static const String loginUrl = 'https://api.socialverseapp.com/user/login';

  final Dio _dio = Dio();

  Future<bool> login(String username, String password) async {
    try {
      final response = await _dio.post(
        loginUrl,
        data: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        return data['success'];
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
