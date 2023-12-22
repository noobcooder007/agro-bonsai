import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:agro_bonsai/helpers/calculate_years.dart';
import 'package:agro_bonsai/providers/employees/employee_provider.dart';
import 'package:agro_bonsai/shared/custom_form.dart';
import 'package:agro_bonsai/shared/custom_list_tile.dart';
import 'package:agro_bonsai/presentation/employees/widgets/add_employee_form.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  @override
  Widget build(BuildContext context) {
    final employees = context.watch<EmployeeProvider>().employees;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empleados'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...employees.map((e) => CustomListTile(
                    leading: Text(e.fcFirstName[0].toString()),
                    trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                    title: Text(
                        '${e.fcFirstName} ${e.fcFirstLastName} ${e.fcSecondLastName}'),
                    subtitle: [
                      Text('${Utils.calculateYears(e.fdBirthday)} años'),
                      const Text('Jornada completa')
                    ]))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Añadir empleado'),
          icon: const Icon(Icons.person_add_outlined),
          onPressed: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                context: context,
                builder: (_) => const CustomForm(child: AddEmployeeForm()));
          }),
    );
  }
}
