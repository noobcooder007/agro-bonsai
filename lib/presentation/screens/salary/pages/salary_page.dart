import 'package:agro_bonsai/helpers/current_date.dart';
import 'package:flutter/material.dart';

import 'package:agro_bonsai/shared/custom_list_tile.dart';

class SalaryPage extends StatelessWidget {
  static const name = 'SALARY';
  const SalaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: Text(
                  'Ganancias',
                  style: TextStyle(fontSize: textTheme.titleLarge?.fontSize),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) => CustomListTile(
                    leading: const Text('J'),
                    title: const Text('Juan Manuel Tejeda Torres'),
                    subtitle: [
                      const Text('\$1200.00'),
                      Text(CustomFormatDate.parse(DateTime.now()))
                    ],
                    trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
