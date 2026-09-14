import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/model/event_category_model.dart';
import 'package:flutter/material.dart';
import 'package:event_app/core/theme/app_colors.dart';

class CategoryTabItem extends StatelessWidget {
  final EventCategoryModel eventCategoryModel;
  final bool isSelected;

  const CategoryTabItem({
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
            ? AppColors.primaryDark
            : AppColors.primary)
            : (context.isDark
            ? AppColors.surfaceDark
            : AppColors.surface),
        border: Border.all(
          color: context.isDark
              ? AppColors.borderDark
              : AppColors.borderLight,
        ),
      ),
      child: Row(
        spacing: 8,
        children: [
          Icon(
            eventCategoryModel.icon,
            size: 24,
            color: isSelected
                ? AppColors.surface
                : (context.isDark
                ? AppColors.primaryDark
                : AppColors.primary),
          ),
          Text(
            eventCategoryModel.name,
            style: context.textTheme.bodySmall!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? AppColors.surface
                  : (context.isDark
                  ? AppColors.surface
                  : AppColors.textPrimary),
            ),
          ),
        ],
      ),
    );
  }
}