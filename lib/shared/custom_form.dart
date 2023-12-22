import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      minChildSize: 0.8,
      maxChildSize: 1.0,
      expand: true,
      builder: (context, scrollController) => SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Añadir empleado',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Nombre(s)'),
                        hintText: 'Ingresa el nombre'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Apelido paterno'),
                        hintText: 'Ingresa el apellido paterno'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Apelido materno'),
                        hintText: 'Ingresa el apellido materno'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InputDatePickerFormField(
                    fieldLabelText: 'Fecha de cumpleaños',
                    fieldHintText: 'Selecciona una fecha',
                    errorInvalidText: 'Formato invalido',
                    selectableDayPredicate: (day) =>
                        day.isBefore(DateTime.now()),
                    errorFormatText: 'Formato invalido',
                    initialDate: DateTime.now(),
                    keyboardType: TextInputType.datetime,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SwitchListTile.adaptive(
                        value: true,
                        title: const Text('Activo'),
                        onChanged: (value) {})),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilledButton.icon(
                        icon: const Icon(Icons.save_outlined),
                        label: const Text('Guardar'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
