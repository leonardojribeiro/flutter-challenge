import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/shared/states/app_state.dart';
import 'package:flutter_challenge/app_widget.dart';
import 'package:flutter_challenge/config/setup_dependencies.dart';
import 'package:flutter_challenge/modules/auth/use_cases/login/login_widget.dart';
import 'package:flutter_challenge/modules/auth/widgets/auth_widget.dart';
import 'package:get_it/get_it.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appState = GetIt.I.get<AppState>();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppStateValue>(
      valueListenable: appState,
      builder: (context, snapshot, child) {
        return MaterialApp(
          title: 'Pets',
          theme: ThemeData(
            primarySwatch: snapshot.primaryColor,
            textTheme: snapshot.textStyle,
            tabBarTheme: TabBarTheme(
              labelColor: snapshot.primaryColor,
              labelStyle: snapshot.textStyle.headline3,
              unselectedLabelStyle: snapshot.textStyle.headline4,
            ),
          ),
          scrollBehavior: const CupertinoScrollBehavior(),
          home: const AuthWidget(
            authenticatedChild: AppWidget(),
            unathenticatedChild: LoginWidget(),
          ),
        );
      },
    );
  }
}
