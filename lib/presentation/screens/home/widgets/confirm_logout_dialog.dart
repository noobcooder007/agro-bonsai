import 'package:flutter/material.dart';

class ConfirmLogoutDialog extends StatelessWidget {
  const ConfirmLogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Atención'),
      content: const Text('Deseas cerrar la sesión'),
      actions: [
        TextButton(
            onPressed: () {
              // response = false;
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancelar')),
        FilledButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Salir'))
      ],
    );
  }
}
