import 'package:eventy_app/core/routes/app_routes.dart';
import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/core/theme/app_theme.dart';
import 'package:eventy_app/model/app_provider/app_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppSettingsProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appSettingsProvider = Provider.of<AppSettingsProvider>(
        context, listen: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: appSettingsProvider.currentTheme,
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      title: "Event app",
      initialRoute: AppRoutesName.splash,
      onGenerateRoute: AppRoutes.generateRoute,
      locale: Locale(appSettingsProvider.currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
