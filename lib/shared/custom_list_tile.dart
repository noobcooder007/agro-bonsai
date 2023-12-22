import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final List<Widget> subtitle;
  final Widget trailing;
  const CustomListTile(
      {super.key,
      required this.leading,
      required this.trailing,
      required this.title,
      required this.subtitle});

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
        onTap: () {},
      ),
    );
    // return Card(
    //   child: ListTile(
    //     titleAlignment: ListTileTitleAlignment.center,
    //     leading: const CircleAvatar(
    //       child: Text('J'),
    //     ),
    //     contentPadding:
    //         const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
    //     title: const Text('Juan Manuel Tejeda Torres'),
    //     subtitle: const Text('26 años - jornada por horas'),
    //     isThreeLine: true,
    //     trailing: IconButton.filledTonal(
    //         onPressed: () {},
    //         icon: const Icon(Icons.keyboard_arrow_right_outlined)),
    //     onTap: () {},
    //   ),
    // );
  }
}
