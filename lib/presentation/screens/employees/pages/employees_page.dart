import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import 'package:agro_bonsai/providers/providers.dart';
import 'package:agro_bonsai/helpers/calculate_difference.dart';
import 'package:agro_bonsai/shared/custom_modal_bottom_sheet_form.dart';
import 'package:agro_bonsai/shared/custom_list_tile.dart';
import 'package:agro_bonsai/domain/entities/employees.dart';
import 'package:agro_bonsai/presentation/screens/screens.dart';
import 'package:agro_bonsai/presentation/screens/employees/widgets/employee_form.dart';

class EmployeesPage extends StatefulWidget {
  static const name = 'EMPLOYEE';
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final authProvider = context.watch<AuthProvider>();
    final employeesProvider = context.watch<EmployeeProvider>();

    return FutureBuilder(
      future: employeesProvider.getEmployees(authProvider.token),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? SafeArea(
                child: Stack(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        child: Text(
                          'Empleados',
                          style: TextStyle(
                              fontSize: textTheme.titleLarge?.fontSize),
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
                                itemCount: employeesProvider.employees.length,
                                itemBuilder: (context, index) => CustomListTile(
                                    leading: Text(employeesProvider
                                        .employees[index].fcFirstname[0]
                                        .toString()),
                                    trailing: const Icon(
                                        Icons.keyboard_arrow_right_outlined),
                                    title: Text(employeesProvider
                                        .employees[index]
                                        .getFullName()),
                                    subtitle: [
                                      const Text('Antigüedad'),
                                      Text(Utils.calculateDifference(
                                          employeesProvider
                                              .employees[index].fdCreatedAt!)),
                                    ],
                                    function: () {
                                      Navigator.pushNamed(
                                          context, EmployeeDetailPage.name,
                                          arguments: {
                                            'id': employeesProvider
                                                .employees[index].pkiId
                                          });
                                    }),
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
                              builder: (_) => CustomModalBottomSheetForm(
                                      child: EmployeeForm(
                                    function: (Employee employee) =>
                                        employeesProvider.addEmployee(
                                            employee, authProvider.token),
                                  )));
                        }),
                  ),
                ]),
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: LinearProgressIndicator(),
                  ),
                ],
              );
      },
    );
  }
}
