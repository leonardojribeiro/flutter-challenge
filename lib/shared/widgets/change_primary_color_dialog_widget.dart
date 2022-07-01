import 'package:flutter/material.dart';
import 'package:flutter_challenge/shared/states/app_state.dart';
import 'package:get_it/get_it.dart';

class ChangePrimaryColorDialogWidget extends StatefulWidget {
  const ChangePrimaryColorDialogWidget({Key? key}) : super(key: key);

  @override
  State<ChangePrimaryColorDialogWidget> createState() => _ChangePrimaryColorDialogWidgetState();
}

class _ChangePrimaryColorDialogWidgetState extends State<ChangePrimaryColorDialogWidget> {
  final appState = GetIt.I.get<AppState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Selecione a cor desejada.'),
      content: Wrap(
        children: Colors.primaries
            .map(
              (e) => InkWell(
                onTap: () {
                  appState.updatePrimaryColor(e);
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 64,
                    height: 64,
                    color: e,
                  ),
                ),
              ),
            )
            .toList(),
      ),
      scrollable: true,
    );
  }
}
