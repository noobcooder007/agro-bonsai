import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import 'package:agro_bonsai/shared/custom_list_tile.dart';
import 'package:agro_bonsai/providers/employees/employee_provider.dart';
import 'package:agro_bonsai/helpers/current_date.dart';
import 'package:agro_bonsai/presentation/screens/piecework/widgets/add_piecework_form.dart';
import 'package:agro_bonsai/providers/piecework/piecework_provider.dart';
import 'package:agro_bonsai/shared/custom_form.dart';
import 'package:agro_bonsai/domain/entities/piecework.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pieceworkProvider = context.watch<PieceworkProvider>();
    final employeeProvider = context.watch<EmployeeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro diario'),
      ),
      body: (pieceworkProvider.pieceworks.isEmpty)
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
                  ...pieceworkProvider.pieceworks.map((e) => CustomListTile(
                          leading: const Icon(Icons.person_pin_outlined),
                          trailing:
                              const Icon(Icons.keyboard_arrow_right_outlined),
                          title: Text(e.fullName),
                          subtitle: [
                            switch (e.fcTypePiecework) {
                              TypePiecework.piece =>
                                const Text('Jornada por destajo'),
                              TypePiecework.hours =>
                                const Text('Jornada por horas'),
                              TypePiecework.none => Container()
                            },
                            Text(CustomFormatDate.parse(e.fdCreatedAt))
                          ]))
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Añadir registro'),
          icon: const Icon(Icons.add_outlined),
          onPressed: () {
            showModalBottomSheet(
                isDismissible: false,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                context: context,
                builder: (_) => CustomForm(
                        child: AddPieceworkForm(
                      employees: employeeProvider.employees,
                      function: (Piecework piecework) =>
                          pieceworkProvider.addPiecework(piecework),
                    )));
          }),
    );
  }
}
