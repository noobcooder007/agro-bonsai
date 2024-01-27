import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:agro_bonsai/providers/auth/auth_provider.dart';
import '../../screens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Agro Bonsai'),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout_outlined),
                onPressed: () async {
                  await authProvider.logOut();
                  if (mounted) {
                    Navigator.pushReplacementNamed(context, 'LOGIN');
                  }
                },
              )
            ],
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
            LogsPage(),
            RegisterPage(),
            EmployeesPage(),
            SalaryPage(),
          ]),
        ));
  }
}
