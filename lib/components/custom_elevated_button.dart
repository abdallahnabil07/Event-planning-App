import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class CustomElevatedButton extends StatefulWidget {
  final String textButton;
  final Color? textColor;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final SvgGenImage? icon;
  final bool? addIcon;

  const CustomElevatedButton({
    super.key,
    required this.textButton,
    required this.backgroundColor,
    required this.onPressed,
    this.icon,
    this.addIcon = false,
    this.textColor = AppColors.whiteColor,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    final theme = Theme.of(context).textTheme;
    return SizedBox(
      width: sizeW * 0.92,
      height: sizeH * 0.063,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.primaryColor, width: 1),
          ),
        ),
        onPressed: widget.onPressed,

        child: widget.addIcon!
            ? Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 70, right: 10),
                    child: widget.icon!.svg(width: 24, height: 24),
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
