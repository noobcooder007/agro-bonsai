import 'package:flutter/material.dart';

import 'package:agro_bonsai/domain/entities/employee.dart';

class EmployeeProvider with ChangeNotifier {
  final List<Employee> _employees = List.empty(growable: true);

  List<Employee> get employees {
    return _employees;
  }

  addEmployee(Employee employee) {
    _employees.add(employee);
    notifyListeners();
  }
}
