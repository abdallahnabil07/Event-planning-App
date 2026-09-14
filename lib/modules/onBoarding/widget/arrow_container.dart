import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ArrowContainer extends StatefulWidget {
  final VoidCallback onTap;
  final IconData icons;

  const ArrowContainer({
    super.key,
    required this.onTap,
    required this.icons,
  });

  @override
  State<ArrowContainer> createState() => _ArrowContainerState();
}

class _ArrowContainerState extends State<ArrowContainer> {
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
          border: BoxBorder.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(25),
        ),

        child: Icon(widget.icons, color: AppColors.primary, size: 18),
      ),
    );
  }
}
