import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/app_colors.dart';

class CustomDropButtonThemeLanguage extends StatelessWidget {
  final String titleText;
  final String firstItemText;
  final String secondItemText;
  final String firstItemTextValue;
  final String secondItemTextValue;
  final AssetGenImage itemImage;
  final AssetGenImage firstValueImage;
  final AssetGenImage secondValueImage;
  final Color? colorImage;
  final Color? colorFirstValueImage;
  final Color? colorSecondValueImage;
  final ValueChanged<String?> onChanged;

  const CustomDropButtonThemeLanguage({
    super.key,
    required this.titleText,
    required this.firstItemText,
    required this.secondItemText,
    required this.firstItemTextValue,
    required this.secondItemTextValue,
    required this.itemImage,
    required this.onChanged,
    this.colorImage,
    required this.firstValueImage,
    required this.secondValueImage,
    this.colorFirstValueImage,
    this.colorSecondValueImage,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorBox = isDark ? AppColors.darkModeColor : AppColors.primaryColor;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: colorBox),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              titleText,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          DropdownButton<String>(
            underline: SizedBox(),

            icon: Row(
              children: [
                itemImage.image(width: 22, height: 22, color: colorImage),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 42,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            items: [
              DropdownMenuItem(
                value: firstItemTextValue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      firstItemText,
                      style: context.textTheme.titleLarge!.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    firstValueImage.image(
                      width: 22,
                      height: 22,
                      color: colorFirstValueImage,
                    ),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: secondItemTextValue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      secondItemText,
                      style: context.textTheme.titleLarge!.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    secondValueImage.image(
                      width: 22,
                      height: 22,
                      color: colorSecondValueImage,
                    ),
                  ],
                ),
              ),
            ],
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
