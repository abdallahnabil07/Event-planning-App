import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColor,
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
      backgroundColor: AppColors.whiteColor,
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
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: TextStyle(
        fontFamily: "inter",
        fontWeight: FontWeight.w400,
        color: AppColors.primaryColor,
        fontSize: 20,
      ),
    ),
  );
}
