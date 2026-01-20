import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextTopSignInUp extends StatelessWidget {
  final String text;

  const CustomTextTopSignInUp({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? AppColors.whiteColor : AppColors.primaryColor;

    return Padding(
      padding: EdgeInsets.only(
        left: context.width * 0.041,
        right: context.width * 0.041,
        top: context.height * 0.027,
        bottom: context.height * 0.018,
      ),
      child: Text(
        text,
        style: context.textTheme.titleLarge!.copyWith(
          fontSize: 24,
          color: textColor,
        ),
      ),
    );
  }
}
