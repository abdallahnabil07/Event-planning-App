import 'package:flutter/material.dart';

abstract class AppColors {
  // ================= Shared =================

  /// Primary brand color (light mode)
  static const Color primary = Color(0xff0E3A99);

  /// Primary brand color (dark mode)
  static const Color primaryDark = Color(0xff457AED);

  /// Error / destructive action
  static const Color error = Color(0xffFF5659);

  /// Disabled state
  static const Color disabled = Color(0xffB9B9B9);

  /// Black text
  static const Color textPrimary = Color(0xff1C1C1C);

  /// Dark grey text
  static const Color textSecondary = Color(0xff686868);

  /// Light grey text / hint
  static const Color textHint = Color(0xffD6D6D6);

  /// White surface
  static const Color surface = Color(0xffF2FEFF);

  // ================= Light Mode =================

  /// Light background
  static const Color backgroundLight = Color(0xffF4F7FF);

  /// Light surface border
  static const Color borderLight = Color(0xffF0F0F0);

  /// Light divider / card
  static const Color cardLight = Color(0xffE9EAEB);

  // ================= Dark Mode =================

  /// Dark background (deepest)
  static const Color backgroundDark = Color(0xff000F30);

  /// Dark surface (cards / containers)
  static const Color surfaceDark = Color(0xff001440);

  /// Dark elevated surface
  static const Color surfaceElevatedDark = Color(0xff000F30);

  /// Dark border / stroke
  static const Color borderDark = Color(0xff002D8F);

  /// Dark primary text
  static const Color textPrimaryDark = Color(0xffFFFFFF);

  /// Dark secondary text
  static const Color textSecondaryDark = Color(0xffD6D6D6);
}