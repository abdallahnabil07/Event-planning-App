import 'package:flutter/material.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/theme/app_colors.dart';

class EventInfoBox extends StatelessWidget {
  final Widget child;

  const EventInfoBox({super.key, required this.child});

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
                ? AppColors.borderDark
                : AppColors.borderLight,
          ),
          color: context.isDark
              ? AppColors.surfaceDark
              : AppColors.surface,
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