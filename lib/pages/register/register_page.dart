import 'package:agro_bonsai/helpers/current_date.dart';
import 'package:agro_bonsai/widgets/custom_form.dart';
import 'package:agro_bonsai/widgets/custom_bottom_sheet.dart';
import 'package:agro_bonsai/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro diario'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomListTile(
                leading: const Icon(Icons.person_pin_outlined),
                title: const Text('Juan Manuel Tejeda Torres'),
                subtitle: [
                  const Text('Botes: 2'),
                  Text(CustomFormatDate.parse(DateTime.now()))
                ],
                trailing: const Icon(Icons.keyboard_arrow_right_outlined))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Añadir registro'),
          icon: const Icon(Icons.add_outlined),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (_) => const CustomBottomSheet(
                      form: CustomForm(),
                    ));
          }),
    );
  }
}
