import 'package:flutter/material.dart';

import 'package:agro_bonsai/domain/models/employee.dart';

class AddEmployeeForm extends StatefulWidget {
  final Function(Employee) function;

  const AddEmployeeForm({super.key, required this.function});

  @override
  State<AddEmployeeForm> createState() => _AddEmployeeFormState();
}

class _AddEmployeeFormState extends State<AddEmployeeForm> {
  final _formKey = GlobalKey<FormState>();
  final firstNameTextController = TextEditingController();
  final firstLastnameTextController = TextEditingController();
  final secondLastnameTextController = TextEditingController();
  late final DateTime birthday;

  @override
  void dispose() {
    firstNameTextController.dispose();
    firstLastnameTextController.dispose();
    secondLastnameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Añadir empleado',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              controller: firstNameTextController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Nombre(s)'),
                  hintText: 'Ingresa el nombre'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autofocus: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obligatorio';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              controller: firstLastnameTextController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Apelido paterno'),
                  hintText: 'Ingresa el apellido paterno'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obligatorio';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              controller: secondLastnameTextController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Apelido materno'),
                  hintText: 'Ingresa el apellido materno'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obligatorio';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20.0,
            ),
            InputDatePickerFormField(
              fieldLabelText: 'Fecha de cumpleaños',
              fieldHintText: 'Selecciona una fecha',
              errorInvalidText: 'Formato invalido',
              selectableDayPredicate: (day) => day.isBefore(DateTime.now()),
              errorFormatText: 'Formato invalido',
              initialDate: DateTime.now(),
              keyboardType: TextInputType.datetime,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              onDateSaved: (value) {
                birthday = value;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            const SwitchListTile.adaptive(
                value: true, title: Text('Activo'), onChanged: null),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.icon(
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('Guardar'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final employee = Employee(
                          pkiId: null,
                          fcFirstName: firstNameTextController.text.trim(),
                          fcFirstLastName:
                              firstLastnameTextController.text.trim(),
                          fcSecondLastName:
                              secondLastnameTextController.text.trim(),
                          fdBirthday: birthday,
                          fdCreatedAt: DateTime.now(),
                          fiIsActive: true);
                      widget.function(employee);
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Empleado añadido con exito')));
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            )
          ],
        ),
      ),
    );
  }
}
