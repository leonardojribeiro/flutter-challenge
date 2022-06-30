import 'package:flutter/material.dart';
import 'package:flutter_challenge/modules/auth/auth_repository.dart';
import 'package:get_it/get_it.dart';

class AuthState extends ValueNotifier<AuthStateValue> {
  AuthState()
      : super(
          AuthStateValue(
            authValue: AuthValue.unauthenticated,
          ),
        );
  final _authRepository = GetIt.I.get<AuthRepository>();

  Future<void> login({required BuildContext context, required String email}) async {
    final signedIn = await _authRepository.login(context: context, email: email);
    if (signedIn) {
      value = AuthStateValue(
        authValue: AuthValue.authenticated,
        email: email,
      );
      notifyListeners();
    }
  }

  Future<void> persistedLogin({required BuildContext context}) async {
    final email = await _authRepository.persistedLogin(context: context);
    if (email != null) {
      value = AuthStateValue(
        authValue: AuthValue.authenticated,
        email: email,
      );
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _authRepository.logout();
    value = AuthStateValue(
      authValue: AuthValue.unauthenticated,
    );
    notifyListeners();
  }
}

enum AuthValue {
  authenticated,
  unauthenticated,
}

class AuthStateValue {
  final AuthValue authValue;
  final String? email;
  AuthStateValue({
    required this.authValue,
    this.email,
  });

  @override
  String toString() => 'AuthStateValue(authValue: $authValue, email: $email)';
}
