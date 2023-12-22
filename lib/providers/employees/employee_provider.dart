import 'package:flutter/material.dart';

import 'package:agro_bonsai/domain/models/employee.dart';

class EmployeeProvider with ChangeNotifier {
  final List<Employee> _employees = List.empty();

  get employees {
    return _employees;
  }

  addEmployee(Employee employee) {
    _employees.add(employee);
    notifyListeners();
  }
}
