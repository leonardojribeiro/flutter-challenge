import 'package:flutter/material.dart';

class AppState extends ValueNotifier<AppStateValue> {
  AppState()
      : super(AppStateValue(
          primaryColor: Colors.blue,
          textStyle: const TextTheme(),
        ));

  void updatePrimaryColor(MaterialColor newPrimaryColor) {
    value = value.copyWith(primaryColor: newPrimaryColor);
    notifyListeners();
  }

  void updateTextStyle(TextTheme newTextStyle) {
    value = value.copyWith(textStyle: newTextStyle);
    notifyListeners();
  }
}

class AppStateValue {
  final MaterialColor primaryColor;
  final TextTheme textStyle;
  AppStateValue({
    required this.primaryColor,
    required this.textStyle,
  });

  AppStateValue copyWith({
    MaterialColor? primaryColor,
    TextTheme? textStyle,
  }) {
    return AppStateValue(
      primaryColor: primaryColor ?? this.primaryColor,
      textStyle: textStyle ?? this.textStyle,
    );
  }
}
