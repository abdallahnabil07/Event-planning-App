import 'package:flutter/material.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/theme/app_colors.dart';

class CustomSwitchThemeLanguage extends StatelessWidget {
  final String textTitle;
  final AssetGenImage rightImage;
  final AssetGenImage leftImage;
  final Color backGroundColor;
  final VoidCallback onTop;

  const CustomSwitchThemeLanguage({
    super.key,
    required this.textTitle,
    required this.rightImage,
    required this.backGroundColor,
    required this.onTop,
    required this.leftImage,
  });

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    final theme = Theme.of(context).textTheme;
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: sizeW * 0.041,
            vertical: sizeH * 0.018,
          ),
          child: Text(
            textAlign: TextAlign.start,
            textTitle,
            style: theme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(right: sizeW * 0.041),
          width: sizeW * 0.18,
          height: sizeH * 0.034,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: BoxBorder.all(
              color: AppColors.primaryColor,
              width: 2,

            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: onTop,
                  child: rightImage.image(
                    width: sizeW * 0.061,
                    height: sizeH * 0.027,
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: onTop,
                  child: leftImage.image(
                    width: sizeW * 0.061,
                    height: sizeH * 0.027,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
