import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:event_app/core/widgets/components/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorStateWidget extends StatelessWidget {
  final VoidCallback onRetry;
  final String? message;

  const ErrorStateWidget({
    super.key,
    required this.onRetry,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.r,
              color: context.isDark
                  ? AppColors.primaryDark
                  : AppColors.primary,
            ),
            SizedBox(height: 16.h),
            Text(
              message ?? context.appLocalizations.something_went_wrong,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium!.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: context.isDark
                    ? AppColors.surface
                    : AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 24.h),
            AppElevatedButton(
              textButton: context.appLocalizations.retry, // add this key to .arb
              onPressed: onRetry,
              width: 160.w,
            ),
          ],
        ),
      ),
    );
  }
}