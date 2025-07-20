import 'package:flutter/material.dart';
import 'package:tasky/core/services/preference_manegar/preference_manegar.dart';
import 'package:tasky/core/services/preference_manegar/storage_key.dart';

class ThemeController with ChangeNotifier {
  bool isDarkMode = false;
  ThemeMode themeMode = ThemeMode.light;

  void init() {
    isDarkMode = PreferenceManegar().getBool(StorageKey.isDarkMode) ?? false;
    isDarkMode ? themeMode = ThemeMode.dark : themeMode = ThemeMode.light;
  }

  toggelTheme() async {
    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
      isDarkMode = false;
      await PreferenceManegar().setBool(StorageKey.isDarkMode, false);
    } else {
      themeMode = ThemeMode.dark;
      isDarkMode = true;
      await PreferenceManegar().setBool(StorageKey.isDarkMode, true);
    }
    notifyListeners();
  }
}
