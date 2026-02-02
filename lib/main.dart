

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import 'core/l10n/app_localizations.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/app_routes_name.dart';
import 'core/services/loading_services.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';
import 'modules/app_provider/app_settings_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppSettingsProvider(),
      child: MyApp(),
    ),
  );
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appSettingsProvider = Provider.of<AppSettingsProvider>(
      context,
      listen: true,
    );
    return ToastificationWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        themeMode: appSettingsProvider.currentTheme,
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        title: "Event app",
        initialRoute: AppRoutesName.splash,
        onGenerateRoute: AppRoutes.generateRoute,
        locale: Locale(appSettingsProvider.currentLanguage),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
