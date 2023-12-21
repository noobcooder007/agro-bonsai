import 'package:flutter/material.dart';

import 'package:agro_bonsai/pages/salary/salary_page.dart';
import 'package:agro_bonsai/pages/history/history_page.dart';
import 'package:agro_bonsai/pages/personal/personal_page.dart';
import 'package:agro_bonsai/pages/register/register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Agro Bonsai'),
            bottom: const TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.history_outlined),
              ),
              Tab(
                icon: Icon(Icons.menu_outlined),
              ),
              Tab(
                icon: Icon(Icons.group_outlined),
              ),
              Tab(
                icon: Icon(Icons.attach_money_outlined),
              ),
            ]),
          ),
          body: const TabBarView(children: <Widget>[
            HistoryPage(),
            RegisterPage(),
            PersonalPage(),
            SalaryPage(),
          ]),
        ));
  }
}
