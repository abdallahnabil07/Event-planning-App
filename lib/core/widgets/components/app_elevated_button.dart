import 'package:event_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppElevatedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final String textButton;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final bool? addIcon;
  final SvgGenImage? icon;
  final double? heightIcon;
  final double? widthIcon;
  final double? paddingHorizontalForIcon;
  final double? paddingVerticalForIcon;

  const AppElevatedButton({
    super.key,
    required this.textButton,
    this.backgroundColor,
    required this.onPressed,
    this.textColor,
    this.borderColor,
    this.height,
    this.width = double.infinity,
    this.icon,
    this.addIcon,
    this.heightIcon,
    this.widthIcon,
    this.paddingHorizontalForIcon,
    this.paddingVerticalForIcon,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 48.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ??
              (context.isDark ? AppColors.primaryDark : AppColors.primary),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),  // ✅
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 1,
            ),
          ),
        ),
        onPressed: onPressed,
        child: (addIcon == true && icon != null)
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingHorizontalForIcon!,
                  vertical: paddingVerticalForIcon!,
                ),
                child: icon!.svg(
                  width: widthIcon ?? 24.w,    // ✅
                  height: heightIcon ?? 24.h,  // ✅
                ),
              ),
            Text(
              textButton,
              style: context.textTheme.titleLarge!.copyWith(
                color: textColor ?? AppColors.surface,
                fontWeight: FontWeight.w400,
                fontSize: fontSize ?? 20.sp,  // ✅ replaced context.hg(20)
              ),
            ),
          ],
        )
            : Text(
          textAlign: TextAlign.center,
          textButton,
          style: context.textTheme.titleLarge!.copyWith(
            color: textColor ?? AppColors.surface,
            fontWeight: fontWeight,
            fontSize: fontSize ?? 16.sp,  // ✅ added default
          ),
        ),
      ),
    );
  }
}