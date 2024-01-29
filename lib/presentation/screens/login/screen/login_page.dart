import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:agro_bonsai/providers/providers.dart';
import 'package:agro_bonsai/shared/custom_dialog.dart';
import 'package:agro_bonsai/presentation/screens/screens.dart';

class LoginPage extends StatefulWidget {
  static const name = 'LOGIN';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void dispose() {
    usernameTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agro Bonsai'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1, vertical: size.height * 0.2),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: usernameTextController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Usuario'),
                            hintText: 'Ingresa un usuario'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        autofocus: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obligatorio';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        controller: passwordTextController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Contraseña'),
                            hintText: 'Ingresa la contraseña'),
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        autofocus: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obligatorio';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      FilledButton.icon(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            final response = await authProvider.login(
                                fcUsername: usernameTextController.text,
                                fcPassword: passwordTextController.text);
                            if (mounted) {
                              if (response) {
                                Navigator.pushReplacementNamed(
                                    context, HomePage.name);
                              } else {
                                showAdaptiveDialog(
                                  context: context,
                                  builder: (context) {
                                    return const CustomDialog(
                                        title: 'Error',
                                        content:
                                            'Revisa tu conexión y los datos ingresados');
                                  },
                                );
                              }
                            }
                          }
                        },
                        icon: const Icon(Icons.arrow_right_alt_outlined),
                        label: const Text('CONTINUAR'),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
