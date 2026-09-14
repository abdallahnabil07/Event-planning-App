import 'package:event_app/core/gen/assets.gen.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:event_app/core/widgets/components/app_elevated_button.dart';
import 'package:flutter/material.dart';

import 'package:event_app/core/extensions/context_extensions.dart';

class CustomGoogleElevatedButton extends StatelessWidget {
  final String textButton;

  const CustomGoogleElevatedButton({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark
        ? AppColors.primaryDark
        : AppColors.primary;
    final colorElevatedButtonGoogle = isDark
        ? AppColors.surfaceDark
        : AppColors.surface;
    final colorElevatedButtonGoogleBorder = isDark
        ? AppColors.borderDark
        : AppColors.borderLight;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.041,
        vertical: context.height * 0.022,
      ),
      child: AppElevatedButton(
        textColor: textColor,
        addIcon: true,
        
        
        
        icon: Assets.icons.googleIcon,
        textButton: textButton,
        backgroundColor: colorElevatedButtonGoogle,
        borderColor: colorElevatedButtonGoogleBorder,
        onPressed: () {},
        height: context.hg(0),
        fontSize: context.hg(14),
      ),
    );
  }
}
