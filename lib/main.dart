import 'package:event_app/core/app_settings/%20cubit/app_settings_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toastification/toastification.dart';

import 'core/di/service_locator.dart';
import 'core/l10n/app_localizations.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/app_routes_name.dart';
import 'core/services/loading_services.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configLoading();
  await GoogleSignIn.instance.initialize(
    serverClientId:
        '960301872496-nsp63lbhphgrvfuget7tnlrr66b1vh62.apps.googleusercontent.com',
  );
  setupServiceLocator();
  sl<AppSettingsCubit>().initTheme();
  runApp(
    BlocProvider(
      create: (_) => sl<AppSettingsCubit>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          splitScreenMode: true,
          minTextAdapt: true,
          builder: (context, child) => ToastificationWrapper(
            child: MaterialApp(
              // showPerformanceOverlay: true,
              debugShowCheckedModeBanner: false,
              builder: EasyLoading.init(),
              themeMode: state.themeMode,
              theme: AppTheme.lightMode,
              darkTheme: AppTheme.darkMode,
              title: "Event App",
              initialRoute: AppRoutesName.homeScreen,
              onGenerateRoute: AppRoutes.generateRoute,
              locale: Locale(state.language),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            ),
          ),
        );
      },
    );
  }
}
