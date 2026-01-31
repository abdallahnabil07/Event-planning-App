import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../core/extensions/context_extensions.dart';
import '../core/theme/app_colors.dart';

class CustomAppBarLeadingContainer extends StatelessWidget {
  final VoidCallback onTap;

  const CustomAppBarLeadingContainer({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final backgroundColorContainer = context.isDark
        ? AppColors.strokeDarkModeColor
        : AppColors.whiteColor;
    final backgroundColorContainerBorder = context.isDark
        ? AppColors.mainDarkModeColor
        : AppColors.whiteColor;
    final arrowColor = context.isDark
        ? AppColors.whiteColor
        : AppColors.primaryColor;
    return Padding(
      padding:  EdgeInsets.only(left: context.paddingWidth16),
      child: Center(
        child: SizedBox(
          width: context.paddingWidth24,
          height: context.paddingHeight24,
          child: Bounceable(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColorContainer,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: backgroundColorContainerBorder,
                  width: 1,
                ),
              ),
              child: Center(
                child: context.provider.currentLanguage=="en"? Assets.icons.arrowLeft.svg(
                  width: context.paddingWidth18,
                  height: context.paddingHeight18,
                  colorFilter: ColorFilter.mode(arrowColor, BlendMode.srcIn),
                ):Assets.icons.arrowRight.svg(
                    width: context.paddingWidth18,
                    height: context.paddingHeight18,
                    colorFilter: ColorFilter.mode(arrowColor, BlendMode.srcIn),
              ),)
            ),
          ),
        ),
      ),
    );
  }
}
