import 'package:flutter/material.dart';

class DarkModeService extends ChangeNotifier {
  bool _darkMode = true;

  bool get darkMode => _darkMode;

  set darkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }
}