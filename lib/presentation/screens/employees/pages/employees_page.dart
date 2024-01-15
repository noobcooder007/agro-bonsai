import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import 'package:agro_bonsai/domain/entities/employee.dart';
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
    final textTheme = Theme.of(context).textTheme;
    final employeesProvider = context.watch<EmployeeProvider>();

    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Text(
              'Empleados',
              style: TextStyle(fontSize: textTheme.titleLarge?.fontSize),
            ),
          ),
          (employeesProvider.employees.isEmpty)
              ? Center(
                  heightFactor: 2.2,
                  child: SvgPicture.asset(
                    'assets/empty.svg',
                    height: size.height * 0.3,
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => CustomListTile(
                        leading: Text(employeesProvider
                            .employees[index].fcFirstName[0]
                            .toString()),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_outlined),
                        title:
                            Text(employeesProvider.employees[index].fullName),
                        subtitle: [
                          Text(
                              '${Utils.calculateYears(employeesProvider.employees[index].fdBirthday)} años'),
                          const Text('Jornada completa')
                        ]),
                  ),
                ),
        ],
      ),
      Positioned(
        bottom: 16.0,
        right: 16.0,
        child: FloatingActionButton.extended(
            label: const Text('Añadir empleado'),
            icon: const Icon(Icons.person_add_outlined),
            onPressed: () {
              showModalBottomSheet(
                  isDismissible: false,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0))),
                  context: context,
                  builder: (_) => CustomForm(
                          child: AddEmployeeForm(
                        function: (Employee employee) =>
                            employeesProvider.addEmployee(employee),
                      )));
            }),
      ),
    ]);
  }
}
