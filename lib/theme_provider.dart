import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  // Toggle the theme
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}