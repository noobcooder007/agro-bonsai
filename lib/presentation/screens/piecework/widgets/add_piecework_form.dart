import 'package:flutter/material.dart';

import 'package:agro_bonsai/domain/entities/employees.dart';
import 'package:agro_bonsai/domain/entities/pieceworks.dart';

class AddPieceworkForm extends StatefulWidget {
  final Function(Piecework) function;
  final List<Employee> employees;

  const AddPieceworkForm(
      {super.key, required this.function, required this.employees});

  @override
  State<AddPieceworkForm> createState() => _AddPieceworkFormState();
}

class _AddPieceworkFormState extends State<AddPieceworkForm> {
  final _formKey = GlobalKey<FormState>();
  final quantityTextController = TextEditingController();
  TypePiecework _typePiecework = TypePiecework.none;
  late final Employee selectedEmployee;

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
              'Añadir registro',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            DropdownButtonFormField(
              items: [
                ...widget.employees.map(
                    (e) => DropdownMenuItem(value: e, child: Text(e.fullName)))
              ],
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Empleado'),
                  hintText: 'Selecciona un empleado'),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autofocus: true,
              validator: (value) {
                if (value == null) {
                  return 'Campo obligatorio';
                }
                return null;
              },
              onChanged: (value) => selectedEmployee = value!,
            ),
            const SizedBox(
              height: 20.0,
            ),
            RadioListTile(
                title: const Text('Por destajo'),
                value: TypePiecework.piece,
                groupValue: _typePiecework,
                onChanged: (value) => setState(() {
                      _typePiecework = value!;
                    })),
            RadioListTile(
                title: const Text('Por horas'),
                value: TypePiecework.hours,
                groupValue: _typePiecework,
                onChanged: (value) => setState(() {
                      _typePiecework = value!;
                    })),
            const SizedBox(
              height: 20.0,
            ),
            (_typePiecework == TypePiecework.piece)
                ? TextFormField(
                    keyboardType: TextInputType.number,
                    controller: quantityTextController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Cantidad'),
                        hintText: 'Ingresa una cantidad'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obligatorio';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                  )
                : Container(),
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
                      final piecework = Piecework(
                          pkiId: null,
                          fkiEmployee: selectedEmployee,
                          fcTypePiecework: _typePiecework,
                          fdCreatedAt: DateTime.now(),
                          fiQuantity: quantityTextController.text.isNotEmpty
                              ? int.parse(quantityTextController.text)
                              : null,
                          fiIsActive: true);
                      widget.function(piecework);
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Registro añadido con exito')));
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
