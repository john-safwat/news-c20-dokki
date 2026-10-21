
import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;
  void changeTheme(ThemeMode mode){
    if(_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
  }
  bool get isDarkMode => _themeMode == ThemeMode.dark;

}