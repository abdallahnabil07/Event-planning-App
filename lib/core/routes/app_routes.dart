import 'package:eventy_app/add_event.dart';
import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/details_event.dart';

import 'package:flutter/material.dart';

import '../../edit_event.dart';
import '../../modules/forget_password/forget_password.dart';
import '../../modules/layout/layout.dart';
import '../../modules/onBoarding/on_boarding_intro_page.dart';
import '../../modules/onBoarding/on_boarding_screen.dart';
import '../../modules/signIn/sign_in_page.dart';
import '../../modules/sign_up/sign_up.dart';
import '../../modules/splash_screen/splash_screen.dart';

abstract class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case AppRoutesName.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
          settings: settings,
        );
        case AppRoutesName.onBoardingIntroPage:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingIntroPage(),
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
      case AppRoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const Layout(),
          settings: settings,
        );
      case AppRoutesName.addEvent:
        return MaterialPageRoute(
          builder: (_) => const AddEvent(),
          settings: settings,
        );
      case AppRoutesName.detailsEvent:
        return MaterialPageRoute(
          builder: (_) => const DetailsEvent(),
          settings: settings,
        );
      case AppRoutesName.editEvent:
        return MaterialPageRoute(
          builder: (_) => const EditEvent(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
