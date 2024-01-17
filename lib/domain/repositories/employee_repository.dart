import 'package:agro_bonsai/domain/entities/employees.dart';

abstract class EmployeeRepository {
  Future<List<Employee>> getEmployees(String token);
  Future<Employee> getEmployeeById(int id, String token);
  Future<bool> createEmployee(Employee employee, int createdBy, String token);
  Future<bool> updateEmployee(Employee employee, int createdBy, String token);
  Future<bool> deleteEmployee(int id, String token);
}
