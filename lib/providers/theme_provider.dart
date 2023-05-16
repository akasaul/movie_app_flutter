import 'package:flutter/material.dart';

enum Theme {
  dark,
  light,
}

class ThemeProvider with ChangeNotifier {
  Theme _currentTheme = Theme.dark;

  void setTheme(Theme theme) {
    _currentTheme = theme;
  }

  Theme get currentTheme {
    return _currentTheme;
  }
}
