
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit() : super(const AppSettingsState());
  void initTheme() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final themeMode =
    brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    emit(state.copyWith(themeMode: themeMode));
  }
  void changeLanguage(String language) {
    emit(state.copyWith(language: language));
  }

  void changeTheme(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  void toggleLanguage() {
    final newLanguage = state.language == 'ar' ? 'en' : 'ar';
    emit(state.copyWith(language: newLanguage));
  }


  void toggleTheme() {
    final newTheme = state.themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    emit(state.copyWith(themeMode: newTheme));
  }

  void changeCurrentIndex(int index) {
    if (state.currentIndex != index) {
      emit(state.copyWith(currentIndex: index));
    }
  }
}