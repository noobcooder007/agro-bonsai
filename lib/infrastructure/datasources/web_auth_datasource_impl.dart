import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:agro_bonsai/domain/entities/auth.dart';
import 'package:agro_bonsai/infrastructure/models/auth_response.dart';
import 'package:agro_bonsai/domain/datasources/auth_datasource.dart';
import 'package:agro_bonsai/infrastructure/mappers/auth_mapper.dart';

class WebAuthDatasource implements AuthDatasource {
  @override
  Future<Auth> login(
      {required String fcUsername, required String fcPassword}) async {
    final baseUrl = dotenv.env['BASE_URL'];
    try {
      final response = await Dio().post('${baseUrl}auth/login',
          data: {'fcUsername': fcUsername, 'fcPassword': fcPassword},
          options: Options(
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json));
      final responseData = AuthResponse.fromJson(response.data);
      final auth = AuthMapper.authResponseToAuthEntity(responseData);
      return auth;
    } on DioException catch (e) {
      final responseData = AuthResponse.fromJson(e.response?.data);
      final auth = AuthMapper.authResponseToAuthEntity(responseData);
      return auth;
    }
  }

  @override
  Future<Auth> renew({required String token}) async {
    final baseUrl = dotenv.env['BASE_URL'];
    try {
      final response = await Dio().post('${baseUrl}auth/renew',
          options: Options(
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json,
              headers: {'x-token': token}));
      final responseData = AuthResponse.fromJson(response.data);
      final auth = AuthMapper.authResponseToAuthEntity(responseData);
      return auth;
    } on DioException catch (e) {
      final responseData = AuthResponse.fromJson(e.response?.data);
      final auth = AuthMapper.authResponseToAuthEntity(responseData);
      return auth;
    }
  }
}
