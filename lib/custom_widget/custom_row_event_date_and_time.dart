import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../core/extensions/context_extensions.dart';
import '../core/gen/assets.gen.dart';
import '../core/theme/app_colors.dart';

class CustomRowEventDateAndTime extends StatelessWidget {
  final SvgGenImage icon;
  final String leftText;
  final String rightTex;
  final VoidCallback? onTap;

  const CustomRowEventDateAndTime({
    super.key,
    required this.icon,
    required this.leftText,
    required this.rightTex, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 8,
      children: <Widget>[
        SizedBox(width: context.paddingWidth12),
        //calendarAdd
        Padding(
          padding: EdgeInsets.symmetric(vertical: context.paddingHeight16),
          child: icon.svg(
            colorFilter: ColorFilter.mode(
              context.isDark
                  ? AppColors.mainDarkModeColor
                  : AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: context.paddingHeight16),
          child: Text(
            leftText,
            style: context.textTheme.titleLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: context.isDark
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Bounceable(
            onTap: onTap,
            child: Text(
              rightTex,
              style: context.textTheme.titleLarge!.copyWith(
                color: context.isDark
                    ? AppColors.mainDarkModeColor
                    : AppColors.primaryColor,
                fontSize: 14,
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
