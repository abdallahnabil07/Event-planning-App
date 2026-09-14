import 'package:event_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTheme {
  static const isDark = true;
  static final textColorTitle = isDark
      ? AppColors.surface
      : AppColors.textPrimary;
  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    useMaterial3: true,
    primaryColor: AppColors.primary,
    fontFamily: "inter",
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        //20
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
      titleMedium: TextStyle(
        //16
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
    ),
    appBarTheme:  AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.primary,
        fontSize: 20.sp,
      ),
    ),
  );
  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.backgroundDark,
    useMaterial3: true,
    primaryColor: AppColors.primary,
    fontFamily: "inter",
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        //20
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
      titleMedium: TextStyle(
        //16
        fontWeight: FontWeight.w500,
        color: AppColors.surface,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.primary,
      titleTextStyle: TextStyle(
        fontFamily: "inter",
        fontWeight: FontWeight.w400,
        color: textColorTitle,
        fontSize: 20.sp,
      ),
    ),
  );
}
