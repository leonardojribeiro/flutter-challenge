import 'package:flutter/material.dart';
import 'package:flutter_challenge/modules/auth/auth_state.dart';
import 'package:flutter_challenge/modules/cats/use_cases/find_cats/find_cats_widget.dart';
import 'package:flutter_challenge/modules/dogs/use_cases/find_dogs/find_dogs_widget.dart';
import 'package:get_it/get_it.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final authState = GetIt.I.get<AuthState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pets'),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sair'),
                onTap: authState.logout,
              )
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: const [
            TabBar(tabs: [
              Tab(
                child: Text('Gatos'),
              ),
              Tab(
                child: Text('Cachorros'),
              ),
            ]),
            Expanded(
              child: TabBarView(
                children: [
                  FindCatsWidget(),
                  FindDogsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
