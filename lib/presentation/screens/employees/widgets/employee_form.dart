import 'package:flutter/material.dart';

import 'package:agro_bonsai/shared/custom_dialog.dart';
import 'package:agro_bonsai/domain/entities/employees.dart';

class EmployeeForm extends StatefulWidget {
  final Employee? employee;
  final Function(Employee) function;

  const EmployeeForm({super.key, required this.function, this.employee});

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final _formKey = GlobalKey<FormState>();
  final firstNameTextController = TextEditingController();
  final firstLastnameTextController = TextEditingController();
  final secondLastnameTextController = TextEditingController();
  int? employeeId;
  bool employeeIsActive = true;
  DateTime birthday = DateTime.now();
  DateTime createdAt = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.employee != null) {
      firstNameTextController.text = widget.employee!.fcFirstname;
      firstLastnameTextController.text = widget.employee!.fcFirstLastname;
      secondLastnameTextController.text = widget.employee!.fcSecondLastname;
      employeeId = widget.employee!.pkiId as int;
      employeeIsActive = widget.employee!.fiIsActive;
      birthday = widget.employee!.fdBirthday;
      createdAt = widget.employee!.fdCreatedAt as DateTime;
    }
  }

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
              'Añadir/Editar empleado',
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
              initialDate: birthday,
              keyboardType: TextInputType.datetime,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              onDateSaved: (value) {
                birthday = DateTime(value.year, value.month, value.day).toUtc();
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            SwitchListTile.adaptive(
                value: employeeIsActive,
                title: const Text('Activo'),
                onChanged: (value) {
                  setState(() {
                    employeeIsActive = !employeeIsActive;
                  });
                }),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.icon(
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('Guardar'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final employee = Employee(
                          pkiId: employeeId,
                          fcFirstname: firstNameTextController.text.trim(),
                          fcFirstLastname:
                              firstLastnameTextController.text.trim(),
                          fcSecondLastname:
                              secondLastnameTextController.text.trim(),
                          fdBirthday: birthday,
                          fdCreatedAt: createdAt,
                          fiIsActive: employeeIsActive);
                      final response = await widget.function(employee);
                      if (mounted) {
                        if (response) {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Empleado guardado con exito')));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => const CustomDialog(
                                  title: 'Error',
                                  content: 'No se pudo guardar el empleado'));
                        }
                      }
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
