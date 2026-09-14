import 'package:event_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/extensions/context_extensions.dart';
import '/core/theme/app_colors.dart';

class ThemeLanguageSelector extends StatelessWidget {
  final String titleText;
  final Color? titleTextColor;
  final String firstItemText;
  final Color? firstItemSelectedTextColor;  // selected text color
  final Color? secondItemTextColor;          // unselected text color
  final String secondItemText;
  final String firstItemTextValue;
  final String secondItemTextValue;
  final String currentValue;
  final bool isIcon;
  final SvgGenImage? firstIcon;
  final SvgGenImage? secondIcon;
  final Color? colorImage;
  final Color colorSelected;
  final Color colorUnSelected;
  final Color? leftBorderColor;
  final Color? rightBorderColor;
  final ValueChanged<String?> onChanged;

  const ThemeLanguageSelector({
    super.key,
    required this.titleText,
    this.firstItemText = "",
    this.secondItemText = '',
    required this.firstItemTextValue,
    required this.secondItemTextValue,
    required this.onChanged,
    this.colorImage,
    required this.isIcon,
    this.firstIcon,
    this.secondIcon,
    required this.colorSelected,
    required this.colorUnSelected,
    required this.currentValue,
    this.titleTextColor = AppColors.surface,
    this.leftBorderColor = Colors.transparent,
    this.rightBorderColor = Colors.transparent,
    this.secondItemTextColor,
    this.firstItemSelectedTextColor,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        // title
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Text(
            titleText,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
              color: titleTextColor,
            ),
          ),
        ),
        const Spacer(),
        // first container
        GestureDetector(
          onTap: () => onChanged(firstItemTextValue),
          child: Container(
            width: 83.w,
            height: 32.h,
            decoration: BoxDecoration(
              border: BoxBorder.all(
                color: leftBorderColor!,
                strokeAlign: 0.5,
              ),
              borderRadius: BorderRadius.circular(8.r),
              color: currentValue == firstItemTextValue
                  ? colorSelected
                  : colorUnSelected,
            ),
            child: isIcon
                ? Center(child: firstIcon!.svg())
                : Center(
              child: Text(
                textAlign: TextAlign.center,
                firstItemText,
                style: context.textTheme.titleLarge!.copyWith(
                  // ✅ each container checks its OWN selection state
                  color: currentValue == firstItemTextValue
                      ? firstItemSelectedTextColor
                      : secondItemTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: context.paddingWidth8),
        // second container
        GestureDetector(
          onTap: () => onChanged(secondItemTextValue),
          child: Container(
            width: 83.w,
            height: 32.h,
            decoration: BoxDecoration(
              border: BoxBorder.all(
                color: rightBorderColor!,
                strokeAlign: 0.5,
              ),
              borderRadius: BorderRadius.circular(8.r),
              color: currentValue == secondItemTextValue
                  ? colorSelected
                  : colorUnSelected,
            ),
            child: isIcon
                ? Center(child: secondIcon!.svg())
                : Center(
              child: Text(
                textAlign: TextAlign.center,
                secondItemText,
                style: context.textTheme.titleLarge!.copyWith(
                  // ✅ each container checks its OWN selection state
                  color: currentValue == secondItemTextValue
                      ? firstItemSelectedTextColor
                      : secondItemTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}