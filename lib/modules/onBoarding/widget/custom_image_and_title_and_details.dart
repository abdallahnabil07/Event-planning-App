import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:eventy_app/modules/onBoarding/widget/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

import '../../../core/gen/assets.gen.dart';
import 'custom_logo_top_page.dart';

class CustomImageAndTitleAndDetails extends StatelessWidget {
  final AssetGenImage image;
  final String title;
  final String details;
  final PageController pageController;
  final int? currentIndex;

  const CustomImageAndTitleAndDetails({
    super.key,
    required this.image,
    required this.title,
    required this.details,
    required this.pageController, this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: context.paddingHeight32),
        CustomLogoTopPage(isBoarding: true,currentIndex: currentIndex,),
        //image
        Padding(
          padding: EdgeInsets.only(
            top: context.height * 0.072,
            left: context.width * 0.041,
            right: context.width * 0.041,
          ),
          child: SizedBox(
            width: double.infinity,
            child: image.image(fit: BoxFit.cover),
          ),
        ),
        CustomSmoothPageIndicator(pageController: pageController),
        //textTitle
        Padding(
          padding: EdgeInsets.only(
            top: context.height * 0.031,
            left: context.width * 0.041,
            right: context.width * 0.041,
          ),

          child: Text(
            textAlign: TextAlign.start,
            title,
            style: context.textTheme.titleLarge!.copyWith(
              color: context.isDark
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
            ),
          ),
        ),
        //textDetails
        Padding(
          padding: EdgeInsets.only(
            top: context.height * 0.031,
            left: context.width * 0.041,
            right: context.width * 0.041,
          ),
          child: Text(
            textAlign: TextAlign.start,
            details,
            style: context.textTheme.titleMedium!.copyWith(
              color: context.isDark
                  ? AppColors.lightGreyColor
                  : AppColors.darkGreyColor,
            ),
          ),
        ),
      ],
    );
  }
}
