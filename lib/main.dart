import 'package:agro_bonsai/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:provider/provider.dart';

import 'package:agro_bonsai/providers/providers.dart';
import 'package:agro_bonsai/theme/color_schemes.dart';

import 'package:agro_bonsai/infrastructure/datasources/web_employee_datasource_impl.dart';
import 'package:agro_bonsai/infrastructure/repositories/web_employee_repository_impl.dart';
import 'package:agro_bonsai/infrastructure/datasources/web_auth_datasource_impl.dart';
import 'package:agro_bonsai/infrastructure/repositories/web_auth_repository_impl.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => EmployeeProvider(
                employeeRepository: WebEmployeeRepository(
                    employeeDatasource: WebEmployeeDatasource()))),
        ChangeNotifierProvider(create: (_) => PieceworkProvider()),
        ChangeNotifierProvider(create: (_) => LogProvider()),
        ChangeNotifierProvider(
            create: (_) => AuthProvider(
                authRepository:
                    WebAuthRepository(authDatasource: WebAuthDatasource()))),
      ],
      child: MaterialApp(
        initialRoute: 'LOADING',
        routes: appRoutes,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      ),
    );
  }
}
