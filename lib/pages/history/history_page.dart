import 'package:agro_bonsai/helpers/current_date.dart';
import 'package:agro_bonsai/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro historico'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Registro'),
                subtitle: [
                  const Text('2 botes a nombre de Juan Manuel Tejeda Torres'),
                  Text(CustomFormatDate.parse(DateTime.now()))
                ],
                trailing: const Icon(Icons.keyboard_arrow_right_outlined)),
            CustomListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Registro'),
                subtitle: [
                  const Text('Nuevo empleado Celtzin Araceli Herrera Mendoza'),
                  Text(CustomFormatDate.parse(DateTime.now()))
                ],
                trailing: const Icon(Icons.keyboard_arrow_right_outlined)),
            CustomListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Consulta'),
                subtitle: [
                  const Text('Calculo el salario de los empleados'),
                  Text(CustomFormatDate.parse(DateTime.now()))
                ],
                trailing: const Icon(Icons.keyboard_arrow_right_outlined)),
          ],
        ),
      ),
    );
  }
}
