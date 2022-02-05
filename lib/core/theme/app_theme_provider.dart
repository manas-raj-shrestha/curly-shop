import 'package:flutter/material.dart';
import 'package:unit_test/core/theme/app_themes.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = CustomTheme.lightTheme;

  void toggleTheme() {
    currentTheme = currentTheme == CustomTheme.lightTheme
        ? CustomTheme.darkTheme
        : CustomTheme.lightTheme;
    notifyListeners();
  }
}
