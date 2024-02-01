import 'package:agro_bonsai/domain/entities/employees.dart';
import 'package:agro_bonsai/presentation/screens/employees/widgets/employee_form.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:agro_bonsai/providers/providers.dart';

class EmployeeDetailPage extends StatefulWidget {
  static const name = 'EMPLOYEE';
  const EmployeeDetailPage({super.key});

  @override
  State<EmployeeDetailPage> createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  @override
  Widget build(BuildContext context) {
    final employeeProvider = context.watch<EmployeeProvider>();
    final authProvider = context.watch<AuthProvider>();
    final params = ModalRoute.of(context)!.settings.arguments as Map;
    final int employeeId = params['id'];
    final employee =
        employeeProvider.employees.firstWhere((e) => e.pkiId == employeeId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar empleado'),
      ),
      body: SingleChildScrollView(
        child: EmployeeForm(
            function: (Employee employee) =>
                employeeProvider.updateEmployee(employee, authProvider.token),
            employee: employee),
      ),
    );
  }
}
