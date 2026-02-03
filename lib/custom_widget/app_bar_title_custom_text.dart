import 'package:flutter/material.dart';

import '../core/extensions/context_extensions.dart';
import '../core/theme/app_colors.dart';
class AppBarTitleCustomText extends StatelessWidget {
  final String titleText;
  const AppBarTitleCustomText({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: context.textTheme.bodyMedium!.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: context.isDark ? AppColors.whiteColor : AppColors.blackColor,
      ),
    );
  }
}
