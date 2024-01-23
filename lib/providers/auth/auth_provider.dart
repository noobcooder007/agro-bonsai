import 'package:flutter/material.dart';

import 'package:agro_bonsai/domain/repositories/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  String _token = '';

  final AuthRepository _authRepository;

  AuthProvider({required AuthRepository authRepository})
      : _authRepository = authRepository;

  String get token {
    return _token.isEmpty ? 'Sin token' : _token;
  }

  set token(String value) {
    _token = value;
  }

  Future<bool> login(
      {required String fcUsername, required String fcPassword}) async {
    final authResponse = await _authRepository.login(
        fcUsername: fcUsername, fcPassword: fcPassword);
    _token = authResponse.token ?? '';
    notifyListeners();
    if (authResponse.ok) {
      return true;
    } else {
      return false;
    }
  }
}
