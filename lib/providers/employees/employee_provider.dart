import 'package:flutter/material.dart';

import 'package:agro_bonsai/domain/entities/employees.dart';
import 'package:agro_bonsai/domain/repositories/employee_repository.dart';

class EmployeeProvider with ChangeNotifier {
  final List<Employee> _employees = List.empty(growable: true);
  final EmployeeRepository _employeeRepository;

  EmployeeProvider({required EmployeeRepository employeeRepository})
      : _employeeRepository = employeeRepository;

  Future<void> getEmployees(String token) async {
    final employees = await _employeeRepository.getEmployees(token);
    _employees.clear();
    _employees.addAll(employees);
  }

  List<Employee> get employees {
    return _employees;
  }

  Future<bool> addEmployee(Employee employee, String token) async {
    final response = await _employeeRepository.createEmployee(employee, token);
    if (response) {
      _employees.add(employee);
      notifyListeners();
    }
    return response;
  }
}
