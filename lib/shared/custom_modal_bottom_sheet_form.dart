import 'package:flutter/material.dart';

class CustomModalBottomSheetForm extends StatefulWidget {
  final Widget child;

  const CustomModalBottomSheetForm({super.key, required this.child});

  @override
  State<CustomModalBottomSheetForm> createState() =>
      _CustomModalBottomSheetFormState();
}

class _CustomModalBottomSheetFormState
    extends State<CustomModalBottomSheetForm> {
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
