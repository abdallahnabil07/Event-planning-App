import 'package:flutter/material.dart';
import '../core/extensions/context_extensions.dart';
import '../core/theme/app_colors.dart';

class TimeDateDescriptionBox extends StatelessWidget {
  final Widget child;

  const TimeDateDescriptionBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingWidth16,
        vertical: context.paddingHeight16,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: context.isDark
                ? AppColors.strokeDarkModeColor
                : AppColors.whiteColorBorder,
          ),
          color: context.isDark
              ? AppColors.secondDarkModeColor
              : AppColors.whiteColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.paddingWidth16,
            vertical: context.paddingHeight16,
          ),
          child: child,
        ),
      ),
    );
  }
}
