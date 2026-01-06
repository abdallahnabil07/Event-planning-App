import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/model/onBoardingLight/on_boarding_first_page.dart';
import 'package:eventy_app/model/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case AppRoutesName.onBoardingPage:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingFirstPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
