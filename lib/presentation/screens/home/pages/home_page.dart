import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../screens.dart';
import 'package:agro_bonsai/providers/auth/auth_provider.dart';
import 'package:agro_bonsai/presentation/screens/home/widgets/confirm_logout_dialog.dart';

class HomePage extends StatefulWidget {
  static const name = 'HOME';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    handleLogout() async {
      final response = (await showDialog<bool>(
          context: context,
          builder: (context) => const ConfirmLogoutDialog()))!;
      if (response) {
        await authProvider.logOut();
        if (mounted) {
          Navigator.pushReplacementNamed(context, LoginPage.name);
        }
      }
    }

    handleClick(value) async {
      switch (value) {
        case 0:
          await handleLogout();
          break;
      }
    }

    return DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Agro Bonsai'),
            actions: [
              PopupMenuButton<int>(
                  onSelected: (value) async => handleClick(value),
                  itemBuilder: (context) => [
                        const PopupMenuItem(
                            value: 0, child: Text('Cerrar sesión'))
                      ]),
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
            PieceworkPage(),
            EmployeesPage(),
            SalaryPage(),
          ]),
        ));
  }
}
