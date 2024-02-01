import 'package:agro_bonsai/infrastructure/mappers/update_employee_mapper.dart';
import 'package:dio/dio.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:agro_bonsai/domain/entities/employees.dart';
import 'package:agro_bonsai/infrastructure/models/employees_response.dart';
import 'package:agro_bonsai/domain/datasources/employee_datasource.dart';
import 'package:agro_bonsai/infrastructure/mappers/create_employee_mapper.dart';
import 'package:agro_bonsai/infrastructure/models/create_employe_response.dart';

class WebEmployeeDatasource implements EmployeeDatasource {
  final dio = Dio()..options.baseUrl = dotenv.env['BASE_URL']!;
  @override
  Future<bool> createEmployee(Employee employee, String token) async {
    final employeeData = CreateEmployeesMapper.toJson(employee);
    try {
      final response = await dio.post('api/employee',
          data: {...employeeData},
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      final responseData = CreateEmployeeResponse.fromJson(response.data);
      return responseData.ok;
    } on DioException catch (e) {
      final responseData = CreateEmployeeResponse.fromJson(e.response?.data);
      return responseData.ok;
    }
  }

  @override
  Future<bool> deleteEmployee(int id, String token) {
    // TODO: implement deleteEmployee
    throw UnimplementedError();
  }

  @override
  Future<Employee> getEmployeeById(int id, String token) {
    // TODO: implement getEmployeeById
    throw UnimplementedError();
  }

  @override
  Future<List<Employee>> getEmployees(String token) async {
    final response = await dio.get('api/employee',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    final responseData = EmployeesResponse.fromJson(response.data);
    final employees =
        CreateEmployeesMapper.employeeResponseToEmployeeEntity(responseData);
    return employees;
  }

  @override
  Future<bool> updateEmployee(Employee employee, String token) async {
    final employeeData = UpdateEmployeesMapper.toJson(employee);
    try {
      final response = await dio.patch('api/employee',
          data: {...employeeData},
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      final responseData = CreateEmployeeResponse.fromJson(response.data);
      return responseData.ok;
    } on DioException catch (e) {
      final responseData = CreateEmployeeResponse.fromJson(e.response?.data);
      return responseData.ok;
    }
  }
}
