import 'package:flutter/material.dart';
import 'auth_model.dart';
import 'auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthModel _authModel = AuthModel();
  final AuthService _authService = AuthService();

  AuthModel get authModel => _authModel;

  Future<void> login(String username, String password) async {
    bool success = await _authService.login(username, password);
    _authModel.setLoggedIn(success);
    notifyListeners();
  }
}
