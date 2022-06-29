import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/app_widget.dart';
import 'package:flutter_challenge/config/setup_dependencies.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        tabBarTheme: const TabBarTheme(labelColor: Colors.blue),
      ),
      scrollBehavior: const CupertinoScrollBehavior(),
      home: const AppWidget(),
    );
  }
}
