import 'package:agro_bonsai/domain/entities/auth.dart';

abstract class AuthDatasource {
  Future<Auth> login({required String fcUsername, required String fcPassword});
}
