import 'package:agro_bonsai/domain/entities/auth.dart';
import 'package:agro_bonsai/domain/datasources/auth_datasource.dart';
import 'package:agro_bonsai/domain/repositories/auth_repository.dart';

class WebAuthRepository implements AuthRepository {
  final AuthDatasource authDatasource;

  WebAuthRepository({required this.authDatasource});

  @override
  Future<Auth> login({required String fcUsername, required String fcPassword}) {
    return authDatasource.login(fcUsername: fcUsername, fcPassword: fcPassword);
  }

  @override
  Future<Auth> renew({required String token}) {
    return authDatasource.renew(token: token);
  }
}
