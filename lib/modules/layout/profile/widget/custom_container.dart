import 'package:flutter/material.dart';

import '/core/extensions/context_extensions.dart';
import '/core/theme/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final Widget widget;

  const CustomContainer({super.key, required this.text, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.paddingWidth16,
        right: context.paddingWidth16,
        bottom: context.paddingHeight16
      ),
      child: Container(
        width: context.width * 0.87,
        height: context.height * 0.054,
        decoration: BoxDecoration(
          color: context.isDark
              ? AppColors.darkModeColor
              : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: context.isDark
                ? AppColors.strokeDarkModeColor
                : AppColors.whiteColorBorder,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: context.paddingWidth16,
                right: context.paddingWidth16,
              ),
              child: Text(
                text,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: context.isDark
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                ),
              ),
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
