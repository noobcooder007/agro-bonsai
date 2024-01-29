import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import 'package:agro_bonsai/shared/custom_form.dart';
import 'package:agro_bonsai/helpers/current_date.dart';
import 'package:agro_bonsai/shared/custom_list_tile.dart';
import 'package:agro_bonsai/domain/entities/pieceworks.dart';
import 'package:agro_bonsai/providers/employees/employee_provider.dart';
import 'package:agro_bonsai/providers/piecework/piecework_provider.dart';
import 'package:agro_bonsai/presentation/screens/piecework/widgets/add_piecework_form.dart';

class PieceworkPage extends StatefulWidget {
  static const name = 'REGISTER';
  const PieceworkPage({super.key});

  @override
  State<PieceworkPage> createState() => _PieceworkPageState();
}

class _PieceworkPageState extends State<PieceworkPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final pieceworkProvider = context.watch<PieceworkProvider>();
    final employeeProvider = context.watch<EmployeeProvider>();

    return SafeArea(
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                'Registro diario',
                style: TextStyle(fontSize: textTheme.titleLarge?.fontSize),
              ),
            ),
            (pieceworkProvider.pieceworks.isEmpty)
                ? Center(
                    heightFactor: 2.2,
                    child: SvgPicture.asset(
                      'assets/empty.svg',
                      height: size.height * 0.3,
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: pieceworkProvider.pieceworks.length,
                        itemBuilder: (context, index) => CustomListTile(
                                leading: const Icon(Icons.person_pin_outlined),
                                trailing: const Icon(
                                    Icons.keyboard_arrow_right_outlined),
                                title: Text(pieceworkProvider
                                    .pieceworks[index].fullName),
                                subtitle: [
                                  switch (pieceworkProvider
                                      .pieceworks[index].fcTypePiecework) {
                                    TypePiecework.piece =>
                                      const Text('Jornada por destajo'),
                                    TypePiecework.hours =>
                                      const Text('Jornada por horas'),
                                    TypePiecework.none => Container()
                                  },
                                  Text(CustomFormatDate.parse(pieceworkProvider
                                      .pieceworks[index].fdCreatedAt))
                                ])),
                  ),
          ],
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton.extended(
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
        ),
      ]),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Registro diario'),
    //   ),
    //   body: (pieceworkProvider.pieceworks.isEmpty)
    //       ? Center(
    //           heightFactor: 2.2,
    //           child: SvgPicture.asset(
    //             'assets/empty.svg',
    //             height: size.height * 0.3,
    //           ),
    //         )
    //       : SingleChildScrollView(
    //           child: Column(
    //             children: [
    //               ...pieceworkProvider.pieceworks.map((e) => CustomListTile(
    //                       leading: const Icon(Icons.person_pin_outlined),
    //                       trailing:
    //                           const Icon(Icons.keyboard_arrow_right_outlined),
    //                       title: Text(e.fullName),
    //                       subtitle: [
    //                         switch (e.fcTypePiecework) {
    //                           TypePiecework.piece =>
    //                             const Text('Jornada por destajo'),
    //                           TypePiecework.hours =>
    //                             const Text('Jornada por horas'),
    //                           TypePiecework.none => Container()
    //                         },
    //                         Text(CustomFormatDate.parse(e.fdCreatedAt))
    //                       ]))
    //             ],
    //           ),
    //         ),
    //   floatingActionButton: FloatingActionButton.extended(
    //       label: const Text('Añadir registro'),
    //       icon: const Icon(Icons.add_outlined),
    //       onPressed: () {
    //         showModalBottomSheet(
    //             isDismissible: false,
    //             shape: const RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.only(
    //                     topLeft: Radius.circular(10.0),
    //                     topRight: Radius.circular(10.0))),
    //             context: context,
    //             builder: (_) => CustomForm(
    //                     child: AddPieceworkForm(
    //                   employees: employeeProvider.employees,
    //                   function: (Piecework piecework) =>
    //                       pieceworkProvider.addPiecework(piecework),
    //                 )));
    //       }),
    // );
  }
}
