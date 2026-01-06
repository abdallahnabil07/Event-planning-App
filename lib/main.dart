import 'package:eventy_app/core/routes/app_routes.dart';
import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      title: "Event app",
      initialRoute: AppRoutesName.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
