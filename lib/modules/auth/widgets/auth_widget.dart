import 'package:flutter/material.dart';
import 'package:flutter_challenge/modules/auth/auth_state.dart';
import 'package:get_it/get_it.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({
    Key? key,
    required this.authenticatedChild,
    required this.unathenticatedChild,
  }) : super(key: key);
  final Widget authenticatedChild;
  final Widget unathenticatedChild;

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final authState = GetIt.I.get<AuthState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: authState.persistedLogin(context: context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ValueListenableBuilder<AuthStateValue>(
          valueListenable: authState,
          builder: (context, value, child) {
            if (value.authValue == AuthValue.authenticated) {
              return widget.authenticatedChild;
            }
            return widget.unathenticatedChild;
          },
        );
      },
    );
  }
}
