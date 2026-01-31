import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static const isDark = true;
  static final textColorTitle = isDark
      ? AppColors.whiteColor
      : AppColors.blackColor;
  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backGroudLightMode,
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    fontFamily: "inter",
    textTheme: TextTheme(
      titleLarge: TextStyle(
        //20
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
      titleMedium: TextStyle(
        //16
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.primaryColor,
        fontSize: 20,
      ),
    ),
  );
  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.darkModeColor,
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    fontFamily: "inter",
    textTheme: TextTheme(
      titleLarge: TextStyle(
        //20
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
      titleMedium: TextStyle(
        //16
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.primaryColor,
      titleTextStyle: TextStyle(
        fontFamily: "inter",
        fontWeight: FontWeight.w400,
        color: textColorTitle,
        fontSize: 20,
      ),
    ),
  );
}
