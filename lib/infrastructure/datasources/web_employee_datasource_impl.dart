import 'package:dio/dio.dart';

import 'package:agro_bonsai/domain/entities/employees.dart';
import 'package:agro_bonsai/infrastructure/models/employees_response.dart';
import 'package:agro_bonsai/domain/datasources/employee_datasource.dart';
import 'package:agro_bonsai/infrastructure/mappers/employee_mapper.dart';

class WebEmployeeDatasource implements EmployeeDatasource {
  @override
  Future<bool> createEmployee(Employee employee, String token) {
    // TODO: implement createEmployee
    throw UnimplementedError();
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
    final response = await Dio().get('http://192.168.0.105:3001/api/employee',
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
