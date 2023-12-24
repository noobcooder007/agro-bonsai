import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:agro_bonsai/helpers/current_date.dart';
import 'package:agro_bonsai/providers/log/log_provider.dart';
import 'package:agro_bonsai/shared/custom_list_tile.dart';

class LogsPage extends StatefulWidget {
  const LogsPage({super.key});

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logsProvider = context.watch<LogProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro historico'),
      ),
      body: (logsProvider.logs.isEmpty)
          ? Center(
              heightFactor: 2.2,
              child: SvgPicture.asset(
                'assets/empty.svg',
                height: size.height * 0.3,
              ))
          : SingleChildScrollView(
              child: Column(
                children: [
                  ...logsProvider.logs.map((e) => CustomListTile(
                          leading: const Icon(Icons.info_outline),
                          trailing:
                              const Icon(Icons.keyboard_arrow_right_outlined),
                          title: Text(e.fcTypeOperation as String),
                          subtitle: [
                            Text(e.fkiEmployee.fullName),
                            Text(e.fcDescription),
                            Text(CustomFormatDate.parse(e.fdCreatedAt))
                          ]))
                  // CustomListTile(
                  //     leading: const Icon(Icons.info_outline),
                  //     title: const Text('Registro'),
                  //     subtitle: [
                  //       const Text('2 botes a nombre de Juan Manuel Tejeda Torres'),
                  //       Text(CustomFormatDate.parse(DateTime.now()))
                  //     ],
                  //     trailing: const Icon(Icons.keyboard_arrow_right_outlined)),
                ],
              ),
            ),
    );
  }
}
