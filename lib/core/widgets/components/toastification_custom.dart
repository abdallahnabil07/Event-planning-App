import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastificationCustom {
  // الدالة الثابتة
  static void show(
      BuildContext context, {
        required ToastificationType type,
        required String title,
        Duration autoCloseDuration = const Duration(seconds: 3),
        Alignment alignment = Alignment.topCenter,
      }) {
    Toastification().show(
      showIcon: true,
      backgroundColor: context.isDark?AppColors.primaryDark: AppColors.borderDark,
      borderSide: BorderSide(color: context.isDark? AppColors.borderDark: AppColors.primaryDark,),
      context: context,

      title: Text(
        textAlign: TextAlign.center,
        title,
        style: context.textTheme.bodyMedium!.copyWith(
          color: AppColors.textPrimaryDark,
        ),
      ),
      type: type,
      alignment: alignment,
      autoCloseDuration: autoCloseDuration,
    );
  }
}
// ToastificationCustom.show(
// alignment: Alignment.bottomCenter,
// title: Text(message),
// type: ToastificationCustomType.error,
// autoCloseDuration: const Duration(seconds: 5),
// );