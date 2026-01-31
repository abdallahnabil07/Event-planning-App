import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xff0E3A99);
  static const Color whiteColor = Color(0xffF2FEFF);
  static const Color backGroudLightMode = Color(0xffF4F7FF);
  static const Color whiteColorBorder = Color(0xffF0F0F0);
  static const Color redColor = Color(0xffFF5659);
  static const Color darkModeColor = Color(0xff000F30);
  static const Color mainDarkModeColor = Color(0xff457AED);
  static const Color secondDarkModeColor = Color(0xff001440);
  static const Color strokeDarkModeColor = Color(0xff002D8F);
  static const Color blackColor = Color(0xff1C1C1C);
  static const Color greyColor = Color(0xffE9EAEB);
  static const Color darkGreyColor = Color(0xff686868);
  static const Color lightGreyColor = Color(0xffD6D6D6);

  static const Color red = Color(0xFFFF3232);         // نفس اللون في الوضعين

  static const Color disable = Color(0xFFB9B9B9);     // نفس في الاثنين

  // ================= Light Mode =================

  /// Main color
  static const Color primaryLight = Color(0xff0E3A99);

  /// Background
  static const Color backgroundLight = Color(0xffF4F7FF);


  /// Red
  static const Color redLight = Color(0xffFF3232);

  // ================= Dark Mode =================

  /// Main color
  static const Color primaryDark = Color(0xff457AED);

  /// Disable
  static const Color disableDark = Color(0xffB9B9B9);

  /// Main text
  static const Color mainTextDark = Color(0xffFFFFFF);

  /// Secondary text
  static const Color secTextDark = Color(0xffD6D6D6);

  /// Background
  static const Color backgroundDark = Color(0xff000F30);



  /// Red
  static const Color redDark = Color(0xffFF3232);
}
