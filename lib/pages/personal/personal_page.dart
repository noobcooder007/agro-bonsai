import 'package:agro_bonsai/widgets/custom_form.dart';
import 'package:agro_bonsai/widgets/custom_bottom_sheet.dart';
import 'package:agro_bonsai/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empleados'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CustomListTile(
              leading: Text('J'),
              title: Text('Juan Manuel Tejeda Torres'),
              subtitle: [Text('26 años'), Text('Jornada por horas')],
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Añadir empleado'),
          icon: const Icon(Icons.person_add_outlined),
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
