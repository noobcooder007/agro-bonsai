import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import 'package:agro_bonsai/domain/models/employee.dart';
import 'package:agro_bonsai/helpers/calculate_years.dart';
import 'package:agro_bonsai/providers/employees/employee_provider.dart';
import 'package:agro_bonsai/shared/custom_form.dart';
import 'package:agro_bonsai/shared/custom_list_tile.dart';
import 'package:agro_bonsai/presentation/screens/employees/widgets/add_employee_form.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final employeesProvider = context.watch<EmployeeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empleados'),
      ),
      body: (employeesProvider.employees.isEmpty)
          ? Center(
              heightFactor: 2.2,
              child: SvgPicture.asset(
                'assets/empty.svg',
                height: size.height * 0.3,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ...employeesProvider.employees.map((e) => CustomListTile(
                          leading: Text(e.fcFirstName[0].toString()),
                          trailing:
                              const Icon(Icons.keyboard_arrow_right_outlined),
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
                isDismissible: false,
                context: context,
                builder: (_) => CustomForm(
                        child: AddEmployeeForm(
                      function: (Employee employee) =>
                          employeesProvider.addEmployee(employee),
                    )));
          }),
    );
  }
}
