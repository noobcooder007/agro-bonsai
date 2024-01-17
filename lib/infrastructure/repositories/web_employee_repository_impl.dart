import 'package:agro_bonsai/domain/datasources/employee_datasource.dart';
import 'package:agro_bonsai/domain/entities/employees.dart';
import 'package:agro_bonsai/domain/repositories/employee_repository.dart';

class WebEmployeeRepository implements EmployeeRepository {
  final EmployeeDatasource employeeDatasource;

  WebEmployeeRepository({required this.employeeDatasource});
  @override
  Future<bool> createEmployee(Employee employee, int createdBy, String token) {
    return employeeDatasource.createEmployee(employee, token);
  }

  @override
  Future<bool> deleteEmployee(int id, String token) {
    return employeeDatasource.deleteEmployee(id, token);
  }

  @override
  Future<Employee> getEmployeeById(int id, String token) {
    return employeeDatasource.getEmployeeById(id, token);
  }

  @override
  Future<List<Employee>> getEmployees(String token) {
    return employeeDatasource.getEmployees(token);
  }

  @override
  Future<bool> updateEmployee(Employee employee, int createdBy, String token) {
    return employeeDatasource.updateEmployee(employee, token);
  }
}
