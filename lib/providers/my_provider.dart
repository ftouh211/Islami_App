import 'package:flutter/material.dart';

class myProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;


  changeTheme(ThemeMode themeMode) {
    appTheme = themeMode;
    notifyListeners();
  }
}
