import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';
import '../core/theme/app_colors.dart';

enum IconPosition { start, end }

class CustomTextField extends StatefulWidget {
  final String hintText;
  final SvgGenImage? icon;
  final IconPosition iconPosition;
  final bool isPassword;
  final TextEditingController? controller;
  final int? maxLine;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.iconPosition = IconPosition.start,
    this.isPassword = false,
    this.controller,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.maxLine = 1,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final fillColor =
        widget.fillColor ??
        (isDark ? AppColors.secondDarkModeColor : AppColors.whiteColor);

    final borderColor =
        widget.borderColor ??
        (isDark ? AppColors.strokeDarkModeColor : AppColors.whiteColorBorder);

    final focusedBorderColor =
        widget.focusedBorderColor ??
        (isDark ? AppColors.whiteColor : AppColors.primaryColor);

    final iconColor = isDark ? AppColors.whiteColor : AppColors.greyColor;

    Widget? buildIcon() {
      if (widget.icon == null) return null;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: widget.icon!.svg(
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      );
    }

    return TextFormField(
      validator: widget.validator,
      maxLines: widget.maxLine,
      controller: widget.controller,
      obscureText: widget.isPassword ? obscureTextPassword : false,
      keyboardType: widget.isPassword
          ? TextInputType.visiblePassword
          : TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,

        prefixIcon:
            widget.icon != null && widget.iconPosition == IconPosition.start
            ? buildIcon()
            : null,

        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureTextPassword = !obscureTextPassword;
                  });
                },
                icon: Icon(
                  obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                  color: iconColor,
                ),
              )
            : widget.icon != null && widget.iconPosition == IconPosition.end
            ? buildIcon()
            : null,

        hintText: widget.hintText,
        hintStyle: theme.textTheme.titleMedium!.copyWith(
          color: isDark ? AppColors.lightGreyColor : AppColors.darkGreyColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: focusedBorderColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.redColor, width: 2),
        ),
      ),
    );
  }
}
