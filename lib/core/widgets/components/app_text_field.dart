import 'package:event_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:event_app/core/theme/app_colors.dart';

enum IconPosition { start, end }

class AppTextField extends StatefulWidget {
  final String? hintText;
  final SvgGenImage? icon;
  final IconPosition iconPosition;
  final bool isPassword;
  final TextEditingController? controller;
  final int? maxLine;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final FormFieldValidator<String>? validator;

  const AppTextField({
    super.key,
    this.hintText,
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
  State<AppTextField> createState() => _AppTextFiledState();
}

class _AppTextFiledState extends State<AppTextField> {
  bool obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final fillColor = widget.fillColor ??
        (isDark ? AppColors.surfaceDark : AppColors.surface);

    final borderColor = widget.borderColor ??
        (isDark ? AppColors.borderDark : AppColors.borderLight);

    final focusedBorderColor = widget.focusedBorderColor ??
        (isDark ? AppColors.surface : AppColors.primary);

    final iconColor = isDark ? AppColors.surface : AppColors.cardLight;

    Widget? buildIcon() {
      if (widget.icon == null) return null;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),  // ✅
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
            obscureTextPassword
                ? Icons.visibility
                : Icons.visibility_off,
            color: iconColor,
            size: 20.r,  // ✅
          ),
        )
            : widget.icon != null && widget.iconPosition == IconPosition.end
            ? buildIcon()
            : null,
        hintText: widget.hintText,
        hintStyle: theme.textTheme.titleMedium!.copyWith(
          color: isDark ? AppColors.textHint : AppColors.textSecondary,
          fontSize: 14.sp,        // ✅
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),  // ✅
          borderSide: BorderSide(color: borderColor, width: 2.w),  // ✅
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: borderColor, width: 2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: focusedBorderColor, width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.error, width: 2.w),
        ),
      ),
    );
  }
}