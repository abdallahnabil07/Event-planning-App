import 'package:flutter/material.dart';

class AppSettingsProvider extends ChangeNotifier {
  String currentLanguage = 'en';
  int _currentIndex = 0;

  bool get isDark => currentTheme == ThemeMode.dark;

  int get currentIndex => _currentIndex;
  ThemeMode currentTheme = ThemeMode.system;

  void changeCurrentIndex(int value) {
    if (_currentIndex != value) {
      _currentIndex = value;
      notifyListeners();
    }
  }

  void toggleLanguage() {
    currentLanguage = currentLanguage == 'ar' ? 'en' : 'ar';
    notifyListeners();
  }

  void toggleTheme() {
    currentTheme = currentTheme == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    notifyListeners();
  }

  void changeLanguage(String newLanguage) {
    currentLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    currentTheme = newTheme;
    notifyListeners();
  }
}
