import 'package:agro_bonsai/domain/entities/auth.dart';

abstract class AuthRepository {
  Future<Auth> login({required String fcUsername, required String fcPassword});
}
