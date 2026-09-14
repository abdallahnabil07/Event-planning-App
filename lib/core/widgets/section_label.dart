import 'package:flutter/material.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionLabel extends StatelessWidget {
  final String text;

  const SectionLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingWidth16),
      child: Text(
        text,
        style: context.textTheme.bodyMedium!.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: context.isDark ? AppColors.surface : AppColors.textPrimary,
        ),
      ),
    );
  }
}