import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final List<Widget> subtitle;
  final Widget trailing;
  final Function()? function;
  const CustomListTile(
      {super.key,
      required this.leading,
      required this.trailing,
      required this.title,
      required this.subtitle,
      this.function});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        leading: CircleAvatar(child: leading),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
        title: title,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [...subtitle],
        ),
        isThreeLine: true,
        trailing: trailing,
        onTap: function,
      ),
    );
  }
}
