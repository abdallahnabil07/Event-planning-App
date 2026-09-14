import 'package:event_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventInfoRow extends StatelessWidget {
  final SvgGenImage icon;
  final String leftText;
  final String rightText;
  final VoidCallback? onTap;

  const EventInfoRow({
    super.key,
    required this.icon,
    required this.leftText,
    required this.rightText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 8.w,
      children: <Widget>[
        SizedBox(width: context.paddingWidth12),
        //calendarAdd
        Padding(
          padding: EdgeInsets.symmetric(vertical: context.paddingHeight16),
          child: icon.svg(
            colorFilter: ColorFilter.mode(
              context.isDark
                  ? AppColors.primaryDark
                  : AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: context.paddingHeight16),
          child: Text(
            leftText,
            style: context.textTheme.titleLarge!.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: context.isDark
                  ? AppColors.surface
                  : AppColors.textPrimary,
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Bounceable(
            onTap: onTap,
            child: Text(
              rightText,
              style: context.textTheme.titleLarge!.copyWith(
                color: context.isDark
                    ? AppColors.primaryDark
                    : AppColors.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}