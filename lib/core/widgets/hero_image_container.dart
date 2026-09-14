import 'package:flutter/material.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroImageContainer extends StatelessWidget {
  final String? lightImage;
  final String? darkImage;

  const HeroImageContainer({super.key, this.lightImage, this.darkImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingWidth16,
        vertical: context.paddingHeight16,
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.isDark
              ? AppColors.surfaceDark
              : AppColors.surface,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: context.isDark
                ? AppColors.borderDark
                : AppColors.borderLight,
            width: 1.w,
          ),
        ),
        child: Center(
          child: Image.asset(
            context.isDark ? darkImage! : lightImage!,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}