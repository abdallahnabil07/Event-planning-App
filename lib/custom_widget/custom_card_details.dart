import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../core/extensions/context_extensions.dart';
import '../core/gen/assets.gen.dart';
import '../core/theme/app_colors.dart';

class CustomCardDetails extends StatefulWidget {
  const CustomCardDetails({super.key});

  @override
  State<CustomCardDetails> createState() => _CustomCardDetailsState();
}

class _CustomCardDetailsState extends State<CustomCardDetails> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingWidth16,
        vertical: context.paddingHeight16,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(

          width: double.infinity,
          height: context.height * 0.21,
          decoration: BoxDecoration(
            color: context.isDark
                ? AppColors.secondDarkModeColor
                : AppColors.whiteColor,
            border: Border.all(
              color: context.isDark
                  ? AppColors.strokeDarkModeColor
                  : AppColors.whiteColorBorder,
            ),

          ),
          child: Stack(
            children: [
              context.isDark
                  ? Assets.images.sportImageLargeDark.image(
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Assets.images.sportImageLargeLight.image(
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              //topBox
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 66,
                  height: 40,
                  decoration: BoxDecoration(
                    color: context.isDark
                        ? AppColors.darkModeColor
                        : AppColors.backgroundLight,
                    border: Border.all(
                      color: context.isDark
                          ? AppColors.strokeDarkModeColor
                          : AppColors.whiteColorBorder,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "21 Jan",
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodySmall!.copyWith(
                        color: context.isDark
                            ? AppColors.mainDarkModeColor
                            : AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              //bottomBox
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: double.infinity,
                    // height: 40,
                    decoration: BoxDecoration(
                      color: context.isDark
                          ? AppColors.darkModeColor
                          : AppColors.backgroundLight,
                      border: Border.all(
                        color: context.isDark
                            ? AppColors.strokeDarkModeColor
                            : AppColors.whiteColorBorder,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "LiverPool against Man city ",
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: context.textTheme.bodySmall!.copyWith(
                              color: context.isDark
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Bounceable(
                            onTap: () {
                              setState(() {
                                isSelected = !isSelected;
                              });
                            },
                            child: isSelected
                                ? Assets.icons.heartSelected.svg()
                                : Assets.icons.heart.svg(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
