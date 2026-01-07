import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class CustomElevatedButton extends StatefulWidget {
  final String textButton;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.textButton,
    required this.backgroundColor,
    required this.onPressed,
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
        ),
        onPressed: widget.onPressed,

        child: Text(
          textAlign: TextAlign.center,
          widget.textButton,
          style: theme.titleLarge!.copyWith(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
