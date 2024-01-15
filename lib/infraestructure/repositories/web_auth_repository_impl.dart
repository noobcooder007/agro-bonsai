import 'package:agro_bonsai/domain/datasources/auth_datasource.dart';
import 'package:agro_bonsai/domain/entities/user.dart';
import 'package:agro_bonsai/domain/repositories/auth_repository.dart';

class WebAuthRepository implements AuthRepository {
  final AuthDatasource authDatasource;

  WebAuthRepository({required this.authDatasource});

  @override
  Future<dynamic> login(
      {required String fcUsername, required String fcPassword}) {
    return authDatasource.login(fcUsername: fcUsername, fcPassword: fcPassword);
  }

  @override
  Future<dynamic> signup({required User user}) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
