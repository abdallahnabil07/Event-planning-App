import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String titleText;
  const AppBarTitle({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: context.textTheme.bodyMedium!.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: context.isDark ? AppColors.surface : AppColors.textPrimary,
      ),
    );
  }
}