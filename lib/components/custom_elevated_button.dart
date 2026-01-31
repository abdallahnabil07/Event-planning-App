import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class CustomElevatedButton extends StatefulWidget {
  final String textButton;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback onPressed;
  final SvgGenImage? icon;
  final bool? addIcon;

  const CustomElevatedButton({
    super.key,
    required this.textButton,
    this.backgroundColor,
    required this.onPressed,
    this.icon,
    this.addIcon = false,
    this.textColor = AppColors.whiteColor,
    this.borderColor,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorElevatedButton = isDark
        ? AppColors.primaryDark
        : AppColors.primaryLight;
    return SizedBox(
      width: context.width * 0.92,
      height: context.height * 0.063,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor ?? colorElevatedButton,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: widget.borderColor ?? AppColors.strokeDarkModeColor,
              width: 1,
            ),
          ),
        ),
        onPressed: widget.onPressed,

        child: widget.addIcon!
            ? Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: context.width * 0.17,
                      right: context.paddingWidth10,
                    ),
                    child: widget.icon!.svg(
                      width: context.paddingWidth24,
                      height: context.paddingHeight24,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    widget.textButton,
                    style: theme.titleLarge!.copyWith(
                      color: widget.textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            : Text(
                textAlign: TextAlign.center,
                widget.textButton,
                style: theme.titleLarge!.copyWith(
                  color: widget.textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
