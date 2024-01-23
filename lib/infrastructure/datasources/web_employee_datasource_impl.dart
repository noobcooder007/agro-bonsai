import 'package:dio/dio.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:agro_bonsai/domain/entities/employees.dart';
import 'package:agro_bonsai/infrastructure/models/employees_response.dart';
import 'package:agro_bonsai/domain/datasources/employee_datasource.dart';
import 'package:agro_bonsai/infrastructure/mappers/employee_mapper.dart';
import 'package:agro_bonsai/infrastructure/models/create_employe_response.dart';

class WebEmployeeDatasource implements EmployeeDatasource {
  @override
  Future<bool> createEmployee(Employee employee, String token) async {
    final baseUrl = dotenv.env['BASE_URL'];
    final employeeData = EmployeesMapper.toJson(employee);
    try {
      final response = await Dio().post('${baseUrl}api/employee',
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
    final baseUrl = dotenv.env['BASE_URL'];
    final response = await Dio().get('${baseUrl}api/employee',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    final responseData = EmployeesResponse.fromJson(response.data);
    final employees =
        EmployeesMapper.employeeResponseToEmployeeEntity(responseData);
    return employees;
  }

  @override
  Future<bool> updateEmployee(Employee employee, String token) {
    // TODO: implement updateEmployee
    throw UnimplementedError();
  }
}
