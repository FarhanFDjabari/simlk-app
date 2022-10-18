import 'package:flutter/material.dart';
import 'package:simlk_app/src/res/resources.dart';

class AppTheme {
  static ThemeData buildThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: Resources.color.indigo700,
        onPrimary: Resources.color.indigo700,
        secondary: Resources.color.indigo100,
        onSecondary: Resources.color.indigo100,
        error: Resources.color.stateNegative,
        onError: Resources.color.stateNegative,
        outline: Resources.color.indigo700,
        onBackground: Resources.color.neutral50,
      ),
    );
  }
}
