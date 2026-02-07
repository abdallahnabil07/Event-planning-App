import 'package:flutter/material.dart';
import '../core/extensions/context_extensions.dart';
import '../core/theme/app_colors.dart';

class ImageTopContainerCustom extends StatelessWidget {
  final String? lightImage;
  final String? darkImage;

  const ImageTopContainerCustom({super.key, this.lightImage, this.darkImage});

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
              ? AppColors.secondDarkModeColor
              : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: context.isDark
                ? AppColors.secondDarkModeColor
                : AppColors.whiteColorBorder,
            width: 1,
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
