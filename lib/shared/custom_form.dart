import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final Widget child;

  const CustomForm({super.key, required this.child});

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
      builder: (context, scrollController) => SingleChildScrollView(
        controller: scrollController,
        child:
            Padding(padding: const EdgeInsets.all(12.0), child: widget.child),
      ),
    );
  }
}
