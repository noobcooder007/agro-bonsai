import 'package:agro_bonsai/domain/entities/user.dart';

abstract class AuthDatasource {
  Future<dynamic> login(
      {required String fcUsername, required String fcPassword});
  Future<dynamic> signup({required User user});
}
