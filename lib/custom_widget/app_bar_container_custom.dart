import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../core/extensions/context_extensions.dart';
import '../core/theme/app_colors.dart';

class CustomAppBarContainer extends StatelessWidget {
  final Widget? icon;
  final double width;
  final double height;
  final VoidCallback onTap;

  const CustomAppBarContainer({
    super.key,
    this.icon,
    required this.width,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColorContainer = context.isDark
        ? AppColors.secondDarkModeColor
        : AppColors.whiteColor;
    final backgroundColorContainerBorder = context.isDark
        ? AppColors.strokeDarkModeColor
        : AppColors.whiteColorBorder;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingWidth8),
      child: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: Bounceable(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: context.isDark
                        ? AppColors.secondDarkModeColor
                        : AppColors.whiteColor,
                    blurRadius: 20,
                    spreadRadius: 1,
                    offset: Offset(0, 4),
                  ),
                ],
                color: backgroundColorContainer,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: backgroundColorContainerBorder,
                  width: 2,
                ),
              ),
              child: Center(child: _buildIcon(context)),
            ),
          ),
        ),
      ),
    );
  }

  Widget? _buildIcon(BuildContext context) {
    final arrowColor = context.isDark
        ? AppColors.whiteColor
        : AppColors.primaryColor;
    if (icon != null) return icon;
    return context.provider.currentLanguage == "en"
        ? Assets.icons.arrowLeft.svg(
            width: context.paddingWidth18,
            height: context.paddingHeight18,
            colorFilter: ColorFilter.mode(arrowColor, BlendMode.srcIn),
          )
        : Assets.icons.arrowRight.svg(
            width: context.paddingWidth18,
            height: context.paddingHeight18,
            colorFilter: ColorFilter.mode(arrowColor, BlendMode.srcIn),
          );
  }
}
