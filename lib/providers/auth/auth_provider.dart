import 'package:flutter/material.dart';

import 'package:agro_bonsai/domain/repositories/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  String _token = '';
  final AuthRepository _authRepository;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthProvider({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<String?> getToken() async {
    final token = await _storage.read(key: 'jwt');
    return token;
  }

  Future<void> setToken(String value) async {
    _token = value;
    await _storage.write(key: 'jwt', value: value);
  }

  String get token {
    return _token;
  }

  Future<bool> login(
      {required String fcUsername, required String fcPassword}) async {
    final authResponse = await _authRepository.login(
        fcUsername: fcUsername, fcPassword: fcPassword);
    notifyListeners();
    if (authResponse.ok) {
      await setToken(authResponse.token!);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    final authResponse =
        await _authRepository.renew(token: token ?? 'no-token');
    if (authResponse.ok) {
      await setToken(authResponse.token!);
      return true;
    } else {
      await logOut();
      return false;
    }
  }

  Future<void> logOut() async {
    return await _storage.delete(key: 'jwt');
  }
}
