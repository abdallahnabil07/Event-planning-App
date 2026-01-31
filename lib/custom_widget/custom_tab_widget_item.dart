import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/model/event_category_model.dart';
import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class CustomTabWidgetItem extends StatelessWidget {
  final EventCategoryModel eventCategoryModel;
  final bool isSelected;

  const CustomTabWidgetItem({
    super.key,
    required this.eventCategoryModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingWidth16,
        vertical: context.paddingHeight8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected
            ? (context.isDark
                  ? AppColors.mainDarkModeColor
                  : AppColors.primaryColor)
            : (context.isDark
                  ? AppColors.secondDarkModeColor
                  : AppColors.whiteColor),
        // color:  context.isDark
        //     ? AppColors.secondDarkModeColor
        //     : AppColors.whiteColor,
        border: Border.all(
          color: context.isDark
              ? AppColors.strokeDarkModeColor
              : AppColors.whiteColorBorder,
        ),
      ),
      child: Row(
        spacing: 8,
        children: [
          Icon(
            eventCategoryModel.icon,
            size: 24,
            color: isSelected
                ? (AppColors.whiteColor)
                : (context.isDark
                      ? AppColors.mainDarkModeColor
                      : AppColors.primaryColor),
          ),
          Text(
            eventCategoryModel.name,
            style: context.textTheme.bodySmall!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected ? (AppColors.whiteColor) : (context.isDark ? AppColors
                  .whiteColor :AppColors.blackColor),
              // color: context.isDark
              //     ? AppColors.whiteColor
              //     : AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
