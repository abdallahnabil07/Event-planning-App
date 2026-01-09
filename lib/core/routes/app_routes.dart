import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/model/forget_password/forget_password.dart';
import 'package:eventy_app/model/onBoarding/on_boarding_fourth.dart';
import 'package:eventy_app/model/onBoarding/on_boarding_second_page.dart';
import 'package:eventy_app/model/signIn/sign_in_page.dart';
import 'package:eventy_app/model/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../model/onBoarding/on_boarding_first_page.dart';
import '../../model/onBoarding/on_boarding_third.dart';
import '../../model/onBoarding/widget/smooth_page_indicator.dart';
import '../../model/sign_up/sign_up.dart';

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
      case AppRoutesName.customSmoothPageIndicator:
        return MaterialPageRoute(
          builder: (_) => const CustomSmoothPageIndicator(),
          settings: settings,
        );
      case AppRoutesName.signIn:
        return MaterialPageRoute(
          builder: (_) => const SignInPage(),
          settings: settings,
        );
      case AppRoutesName.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPassword(),
          settings: settings,
        );
      case AppRoutesName.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUp(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}