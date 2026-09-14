import 'package:event_app/add_event.dart';
import 'package:event_app/core/di/service_locator.dart';
import 'package:event_app/core/routes/app_routes_name.dart';
import 'package:event_app/event_details.dart';
import 'package:event_app/edit_event.dart';
import 'package:event_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:event_app/features/auth/presentation/views/forget_password/forget_password.dart';
import 'package:event_app/features/auth/presentation/views/signIn/sign_in.dart';
import 'package:event_app/features/auth/presentation/views/sign_up/sign_up.dart';
import 'package:event_app/features/events/presentation/cubit/events_cubit.dart';
import 'package:event_app/modules/layout/layout.dart';
import 'package:event_app/modules/onBoarding/onboarding_screen.dart';
import 'package:event_app/modules/onBoarding/onboarding_welcome_page.dart';
import 'package:event_app/modules/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/page_route_builder_custom.dart';

abstract class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.splash:
        return PageRouteBuilderCustom(
          page: const SplashScreen(),
          arguments: settings,
        );
      case AppRoutesName.onBoardingScreen:
        return PageRouteBuilderCustom(
          page: const OnBoardingScreen(),
          arguments: settings,
        );
      case AppRoutesName.onBoardingIntroPage:
        return PageRouteBuilderCustom(
          page: const OnBoardingWelcomePage(),
          arguments: settings,
        );
      case AppRoutesName.signIn:
        return PageRouteBuilderCustom(
          page: BlocProvider(
            create: (_) => sl<AuthCubit>(), // ✅ clean, no manual wiring
            child: const SignIn(),
          ),
          arguments: settings,
        );

      case AppRoutesName.signUp:
        return PageRouteBuilderCustom(
          page: BlocProvider(
            create: (_) => sl<AuthCubit>(),
            child: const SignUp(),
          ),
          arguments: settings,
        );
      case AppRoutesName.forgetPassword:
        return PageRouteBuilderCustom(
          page: BlocProvider(
            create: (_) => sl<AuthCubit>(),
            child: const ForgetPassword(),
          ),
          arguments: settings,
        );
      case AppRoutesName.homeScreen:
        return PageRouteBuilderCustom(
          page: BlocProvider(
            create: (_) => sl<EventsCubit>(),
            child: const Layout(),
          ),
          arguments: settings,
        );
      case AppRoutesName.addEvent:
        return PageRouteBuilderCustom(
          page: BlocProvider(
            create: (_) => sl<EventsCubit>(),
            child: const AddEvent(),
          ),
          arguments: settings,
        );
      case AppRoutesName.eventDetails:
        return PageRouteBuilderCustom(
          page: BlocProvider(
            create: (_) => sl<EventsCubit>(),
            child: const EventDetails(),
          ),
          arguments: settings,
        );
      case AppRoutesName.editEvent:
        return PageRouteBuilderCustom(
          page: BlocProvider(
            create: (_) => sl<EventsCubit>(),
            child: const EditEvent(),
          ),
          arguments: settings,
        );
      default:
        return PageRouteBuilderCustom(
          page: const SplashScreen(),
          arguments: settings,
        );
    }
  }
}
