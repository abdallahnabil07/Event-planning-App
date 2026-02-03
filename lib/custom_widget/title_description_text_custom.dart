import 'package:flutter/material.dart';

import '../core/extensions/context_extensions.dart';
import '../core/theme/app_colors.dart';

class TitleDescriptionTextCustom extends StatelessWidget {
  final String text;

  const TitleDescriptionTextCustom({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingWidth16),
      child: Text(
        text,
        style: context.textTheme.bodyMedium!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: context.isDark ? AppColors.whiteColor : AppColors.blackColor,
        ),
      ),
    );
  }
}
