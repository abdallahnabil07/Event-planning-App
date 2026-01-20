import 'package:flutter/material.dart';

import '../components/custom_elevated_button.dart';
import '../core/extensions/context_extensions.dart';
import '../core/gen/assets.gen.dart';
import '../core/theme/app_colors.dart';

class CustomGoogleElevatedButton extends StatelessWidget {
  final String textButton;

  const CustomGoogleElevatedButton({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark
        ? AppColors.mainDarkModeColor
        : AppColors.primaryColor;
    final colorElevatedButtonGoogle = isDark
        ? AppColors.secondDarkModeColor
        : AppColors.whiteColor;
    final colorElevatedButtonGoogleBorder = isDark
        ? AppColors.strokeDarkModeColor
        : AppColors.whiteColorBorder;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.041,
        vertical: context.height * 0.022,
      ),
      child: CustomElevatedButton(
        textColor: textColor,
        addIcon: true,
        icon: Assets.icons.googleIcon,
        textButton: textButton,
        backgroundColor: colorElevatedButtonGoogle,
        borderColor: colorElevatedButtonGoogleBorder,
        onPressed: () {},
      ),
    );
  }
}
