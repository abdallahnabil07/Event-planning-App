
import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  final PageController pageController;

  const CustomSmoothPageIndicator({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: context.isDark?AppColors.mainDarkModeColor:AppColors.primaryColor,
              dotColor: context.isDark? AppColors.whiteColor:AppColors.darkGreyColor,
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 4,
            ),
          ),
        ),
      ],
    );
  }
}
