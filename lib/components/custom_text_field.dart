import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';
import '../core/theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final SvgGenImage icon;
  final bool? isPassword;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    final theme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorBorder = isDark
        ? AppColors.strokeDarkModeColor
        : AppColors.whiteColorBorder;
    final colorFocusBorder = isDark
        ? AppColors.whiteColor
        : AppColors.primaryColor;
    final fillColor = isDark
        ? AppColors.secondDarkModeColor
        : AppColors.whiteColor;
    final colorPrefixIcon = isDark ? AppColors.whiteColor : AppColors.greyColor;
    final colorSuffixIcon = isDark ? AppColors.whiteColor : AppColors.greyColor;
    final colorHintText = isDark
        ? AppColors.lightGreyColor
        : AppColors.darkGreyColor;
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        suffixIcon: widget.isPassword!
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureTextPassword = !obscureTextPassword;
                  });
                },
                icon: Icon(
                  obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                  color: colorSuffixIcon,
                ),
              )
            : null,
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            left: sizeW * 0.041,
            right: sizeW * 0.03,
            top: sizeH * 0.02,
            bottom: sizeH * 0.02,
          ),
          child: widget.icon.svg(
            colorFilter: ColorFilter.mode(colorPrefixIcon, BlendMode.srcIn),
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: sizeW * 0.071,
          minHeight: sizeH * 0.031,
        ),
        hint: Text(
          widget.hintText,
          style: theme.titleMedium!.copyWith(
            color: colorHintText,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: colorBorder),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: colorFocusBorder),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.redColor),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      obscureText: widget.isPassword! ? obscureTextPassword : false,
      keyboardType: widget.isPassword!
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}
