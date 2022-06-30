import 'package:flutter/material.dart';
import 'package:flutter_challenge/app_state.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeFontDialogWidget extends StatefulWidget {
  const ChangeFontDialogWidget({Key? key}) : super(key: key);

  @override
  State<ChangeFontDialogWidget> createState() => _ChangeFontDialogWidgetState();
}

class _ChangeFontDialogWidgetState extends State<ChangeFontDialogWidget> {
  final appState = GetIt.I.get<AppState>();
  @override
  Widget build(BuildContext context) {
    final fonts = GoogleFonts.asMap().entries.toList();
    return AlertDialog(
      title: const Text('Selecione a fonte desejada.'),
      content: SizedBox(
        width: 256,
        child: ListView.builder(
          itemBuilder: (context, index) {
            final font = fonts[index];

            return ListTile(
              onTap: () {
                appState.updateTextStyle(GoogleFonts.getTextTheme(font.key));
                Navigator.of(context).pop();
              },
              title: Text(
                font.key,
                style: font.value(),
              ),
            );
          },
          itemCount: fonts.length,
        ),
      ),
    );
  }
}
