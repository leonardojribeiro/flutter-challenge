import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future<bool> login({required BuildContext context, required String email}) async {
    final rawJson = await DefaultAssetBundle.of(context).loadString("assets/emails.json");
    final jsonList = jsonDecode(rawJson);
    if (jsonList is List) {
      final logged = jsonList.contains(email);
      if (logged) {
        final preferences = await SharedPreferences.getInstance();
        await preferences.setString('user', email);
      }
      return logged;
    }
    return false;
  }

  Future<String?> persistedLogin({required BuildContext context}) async {
    final rawJson = await DefaultAssetBundle.of(context).loadString("assets/emails.json");
    final preferences = await SharedPreferences.getInstance();
    final email = preferences.getString('user');
    final jsonList = jsonDecode(rawJson);
    if (jsonList is List) {
      final logged = jsonList.contains(email);
      if (logged) {
        return email;
      }
    }
    return null;
  }

  Future<void> logout() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('user');
  }
}
