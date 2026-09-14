import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class Validators {
  Validators._(); // prevent instantiation

  static String? name(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.appLocalizations.name_required;
    }
    if (value.trim().length < 2) {
      return context.appLocalizations.name_too_short;
    }
    return null;
  }

  static String? email(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.appLocalizations.email_required;
    }
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    if (!emailRegex.hasMatch(value.trim())) {
      return context.appLocalizations.invalid_email;
    }
    return null;
  }

  static String? password(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.appLocalizations.password_required;
    }
    final passwordRegex = RegExp(r'^.{6,}$');
    if (!passwordRegex.hasMatch(value.trim())) {
      return context.appLocalizations.invalid_password;
    }
    return null;
  }

  static String? rePassword(
      BuildContext context,
      String? value,
      String originalPassword,
      ) {
    if (value == null || value.trim().isEmpty) {
      return context.appLocalizations.repassword_required;
    }
    if (value.trim() != originalPassword.trim()) {
      return context.appLocalizations.passwords_not_match;
    }
    return null;
  }

  static String? required(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.appLocalizations.required;
    }
    return null;
  }
}