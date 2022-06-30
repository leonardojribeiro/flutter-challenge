import 'package:flutter/material.dart';
import 'package:flutter_challenge/modules/auth/auth_state.dart';
import 'package:get_it/get_it.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final authState = GetIt.I.get<AuthState>();

  Future<void> login() async {
    await authState.login(context: context, email: emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Bem Vindo!'),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Digite seu email para visualizar os pets.'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Digite seu email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: login,
              child: const Text('Login'),
            ),
          )
        ],
      ),
    );
  }
}
