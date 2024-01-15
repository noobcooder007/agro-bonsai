import 'package:dio/dio.dart';

import 'package:agro_bonsai/domain/datasources/auth_datasource.dart';
import 'package:agro_bonsai/domain/entities/user.dart';

class WebAuthDatasource implements AuthDatasource {
  @override
  Future<Response> login(
      {required String fcUsername, required String fcPassword}) async {
    final response = await Dio().post('http://192.168.0.105:3001/auth/login',
        data: {'fcUsername': fcUsername, 'fcPassword': fcPassword},
        options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json));
    return response;
  }

  @override
  Future<Response> signup({required User user}) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
