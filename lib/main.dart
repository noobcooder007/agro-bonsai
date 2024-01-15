import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:agro_bonsai/theme/color_schemes.dart';
import 'package:agro_bonsai/providers/providers.dart';
import 'package:agro_bonsai/infraestructure/datasources/web_auth_datasource_impl.dart';
import 'package:agro_bonsai/infraestructure/repositories/web_auth_repository_impl.dart';
import 'package:agro_bonsai/presentation/screens/login/screen/login_page.dart';
import 'package:agro_bonsai/presentation/screens/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EmployeeProvider()),
        ChangeNotifierProvider(create: (_) => PieceworkProvider()),
        ChangeNotifierProvider(create: (_) => LogProvider()),
        ChangeNotifierProvider(
            create: (_) => AuthProvider(
                authRepository:
                    WebAuthRepository(authDatasource: WebAuthDatasource()))),
      ],
      child: MaterialApp(
        initialRoute: 'login',
        routes: {
          'home': (_) => const HomePage(),
          'login': (_) => const LoginPage()
        },
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      ),
    );
  }
}
