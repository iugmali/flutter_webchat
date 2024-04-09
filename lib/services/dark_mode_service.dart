import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DarkModeService extends ChangeNotifier {
  bool _darkMode = SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;

  bool get darkMode => _darkMode;

  set darkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }
}