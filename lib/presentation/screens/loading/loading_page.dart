import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:agro_bonsai/providers/providers.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: checkLoginState(context),
          builder: (context, snapshot) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: LinearProgressIndicator(),
              ),
            );
          }),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = context.read<AuthProvider>();
    final authenticated = await authService.isLoggedIn();
    if (mounted) {
      if (authenticated) {
        Navigator.pushReplacementNamed(context, 'HOME');
      } else {
        Navigator.pushReplacementNamed(context, 'LOGIN');
      }
    }
  }
}
