import 'package:event_app/core/enums/auth_error_code.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

String mapAuthErrorToMessage(BuildContext context, AuthErrorCode code) {
  final localizations = context.appLocalizations;
  switch (code) {
    case AuthErrorCode.userNotFound:
      return localizations.no_user_found;
    case AuthErrorCode.wrongPassword:
      return localizations.wrong_password;
    case AuthErrorCode.invalidCredential:
      return localizations.no_user_found;
    case AuthErrorCode.emailAlreadyInUse:
      return localizations.email_already_in_use;
    case AuthErrorCode.weakPassword:
      return localizations.weak_password;
    case AuthErrorCode.invalidEmail:
      return localizations.invalid_email;
    case AuthErrorCode.unknown:
      return localizations.something_went_wrong;
    case AuthErrorCode.signInCancelled:
      return localizations.sign_in_cancelled;

  }
}