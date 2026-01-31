import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CustomContainerArrow extends StatefulWidget {
  final VoidCallback onTap;
  final IconData icons;

  const CustomContainerArrow({
    super.key,
    required this.onTap,
    required this.icons,
  });

  @override
  State<CustomContainerArrow> createState() => _CustomContainerArrowState();
}

class _CustomContainerArrowState extends State<CustomContainerArrow> {
  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: sizeW * 0.096,
        height: sizeH * 0.04,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: BoxBorder.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(25),
        ),

        child: Icon(widget.icons, color: AppColors.primaryColor, size: 18),
      ),
    );
  }
}
