import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  const CustomDialog({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      title: Text(
        title,
        style: textTheme.titleMedium,
      ),
      content: Text(
        content,
        maxLines: 2,
        style: textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop())
      ],
    );
  }
}
