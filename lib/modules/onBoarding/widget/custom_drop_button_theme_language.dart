import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '/core/extensions/context_extensions.dart';
import '/core/theme/app_colors.dart';

class CustomDropButtonThemeLanguage extends StatefulWidget {
  final String titleText;
  final Color? titleTextColor;
  final String firstItemText;
  final Color? firstItemSelectedTextColor;
  final Color? secondItemSelectedTextColor;
  final String secondItemText;
  final Color? secondItemTextColor;
  final String firstItemTextValue;
  final String secondItemTextValue;
  final String currentValue;
  final bool isIcon;
  final SvgGenImage? firstIcon;
  final SvgGenImage? secondIcon;
  final Color? colorImage;
  final Color colorSelected;
  final Color colorUnSelected;
  final Color? colorFirstImage;
  final Color? colorSecondImage;
  final Color? leftBorderColor;
  final Color? rightBorderColor;
  final ValueChanged<String?> onChanged;

  const CustomDropButtonThemeLanguage({
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
    this.colorFirstImage,
    this.colorSecondImage,
    required this.colorSelected,
    required this.colorUnSelected,
    required this.currentValue,
    this.titleTextColor = AppColors.whiteColor,
    this.leftBorderColor = Colors.transparent,
    this.rightBorderColor = Colors.transparent,
    this.secondItemTextColor,
    this.firstItemSelectedTextColor,
    this.secondItemSelectedTextColor,
  });

  @override
  State<CustomDropButtonThemeLanguage> createState() =>
      _CustomDropButtonThemeLanguageState();
}

class _CustomDropButtonThemeLanguageState
    extends State<CustomDropButtonThemeLanguage> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorBox = isDark ? AppColors.darkModeColor : AppColors.primaryColor;
    final bool isFirstSelected =
        widget.currentValue == widget.firstItemTextValue;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: colorBox),
      child: Row(
        children: [
          //title
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              widget.titleText,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w500,
                color: widget.titleTextColor,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              widget.onChanged(widget.firstItemTextValue);
            },
            child: Container(
              width: 83,
              height: 32,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.transparent,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
                border: BoxBorder.all(
                  color: widget.leftBorderColor!,
                  strokeAlign: 0.5,
                ),
                borderRadius: BorderRadius.circular(8),
                color: widget.currentValue == widget.firstItemTextValue
                    ? widget.colorSelected
                    : widget.colorUnSelected,
              ),
              child: widget.isIcon
                  ? Center(child: widget.firstIcon!.svg())
                  : Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        widget.firstItemText,
                        style: context.textTheme.titleLarge!.copyWith(
                          color: isFirstSelected
                              ? widget.firstItemSelectedTextColor
                              : widget.secondItemSelectedTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ),
          ),
          SizedBox(width: context.paddingWidth8),
          GestureDetector(
            onTap: () {
              widget.onChanged(widget.secondItemTextValue);
            },
            child: Container(
              width: 83,
              height: 32,
              decoration: BoxDecoration(
                border: BoxBorder.all(
                  color: widget.rightBorderColor!,
                  strokeAlign: 0.5,
                ),
                borderRadius: BorderRadius.circular(8),
                color: widget.currentValue == widget.secondItemTextValue
                    ? widget.colorSelected
                    : widget.colorUnSelected,
              ),
              child: widget.isIcon
                  ? Center(child: widget.secondIcon!.svg())
                  : Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        widget.secondItemText,
                        style: context.textTheme.titleLarge!.copyWith(
                          color: isFirstSelected
                              ? widget.firstItemSelectedTextColor
                              : widget.secondItemSelectedTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ),
          ),
          // DropdownButton<String>(
          //   underline: SizedBox(),
          //
          //   icon: Row(
          //     children: [
          //       itemImage.image(width: 22, height: 22, color: colorImage),
          //       Icon(
          //         Icons.keyboard_arrow_down,
          //         size: 42,
          //         color: AppColors.primaryColor,
          //       ),
          //     ],
          //   ),
          //   items: [
          //     DropdownMenuItem(
          //       value: firstItemTextValue,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             firstItemText,
          //             style: context.textTheme.titleLarge!.copyWith(
          //               color: AppColors.whiteColor,
          //             ),
          //           ),
          //           firstValueImage.image(
          //             width: 22,
          //             height: 22,
          //             color: colorFirstValueImage,
          //           ),
          //         ],
          //       ),
          //     ),
          //     DropdownMenuItem(
          //       value: secondItemTextValue,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             secondItemText,
          //             style: context.textTheme.titleLarge!.copyWith(
          //               color: AppColors.whiteColor,
          //             ),
          //           ),
          //           secondValueImage.image(
          //             width: 22,
          //             height: 22,
          //             color: colorSecondValueImage,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          //   onChanged: onChanged,
          // ),
        ],
      ),
    );
  }
}
