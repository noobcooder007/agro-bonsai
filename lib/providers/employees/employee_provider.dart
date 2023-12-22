import 'package:flutter/material.dart';

import 'package:agro_bonsai/domain/models/employee.dart';

class EmployeeProvider with ChangeNotifier {
  // final List<Employee> _employees = List.empty();
  final List<Employee> _employees = [
    Employee(
        pkiId: 1,
        fcFirstName: 'Juan Manuel',
        fcFirstLastName: 'Tejeda',
        fcSecondLastName: 'Torres',
        fdBirthday: DateTime(1997, 9, 11),
        fdCreatedAt: DateTime.now(),
        fiIsActive: true),
    Employee(
        pkiId: 2,
        fcFirstName: 'John',
        fcFirstLastName: 'Doe',
        fcSecondLastName: '',
        fdBirthday: DateTime(1997, 12, 30),
        fdCreatedAt: DateTime.now(),
        fiIsActive: true)
  ];

  List<Employee> get employees {
    return _employees;
  }

  addEmployee(Employee employee) {
    _employees.add(employee);
    notifyListeners();
  }
}
