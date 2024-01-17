import 'package:agro_bonsai/infrastructure/mappers/auth_mapper.dart';
import 'package:dio/dio.dart';

import 'package:agro_bonsai/domain/entities/auth.dart';
import 'package:agro_bonsai/infrastructure/models/auth_response.dart';
import 'package:agro_bonsai/domain/datasources/auth_datasource.dart';

class WebAuthDatasource implements AuthDatasource {
  @override
  Future<Auth> login(
      {required String fcUsername, required String fcPassword}) async {
    final response = await Dio().post('http://192.168.0.105:3001/auth/login',
        data: {'fcUsername': fcUsername, 'fcPassword': fcPassword},
        options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json));
    final responseData = AuthResponse.fromJson(response.data);
    final auth = AuthMapper.authResponseToAuthEntity(responseData);
    return auth;
  }
}
