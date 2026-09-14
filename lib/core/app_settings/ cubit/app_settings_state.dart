part of 'app_settings_cubit.dart';

class AppSettingsState {
  final String language;
  final ThemeMode themeMode;
  final int currentIndex;

  const AppSettingsState({
    this.language = 'en',
    this.themeMode = ThemeMode.system,
    this.currentIndex = 0,
  });

  bool get isDark => themeMode == ThemeMode.dark;

  AppSettingsState copyWith({
    String? language,
    ThemeMode? themeMode,
    int? currentIndex,
  }) {
    return AppSettingsState(
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  // in AppSettingsState
  String get themeModeValue => themeMode == ThemeMode.dark ? "dark" : "light";
}
