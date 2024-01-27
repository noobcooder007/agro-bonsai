import 'package:flutter/material.dart';

import 'package:agro_bonsai/presentation/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'LOADING': (_) => const LoadingPage(),
  'LOGIN': (_) => const LoginPage(),
  'HOME': (_) => const HomePage()
};
