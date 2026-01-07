import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/model/onBoarding/on_boarding_second_page.dart';
import 'package:eventy_app/model/onBoarding/widget/on_boarding_fourth.dart';
import 'package:eventy_app/model/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../model/onBoarding/on_boarding_first_page.dart';
import '../../model/onBoarding/on_boarding_third.dart';

abstract class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case AppRoutesName.onBoardingFirstPage:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingFirstPage(),
          settings: settings,
        );
      case AppRoutesName.onBoardingSecondPage:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingSecondPage(),
          settings: settings,
        );
      case AppRoutesName.onBoardingThirdPage:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingThird(),
          settings: settings,
        );
      case AppRoutesName.onBoardingFourthPage:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingFourth(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
