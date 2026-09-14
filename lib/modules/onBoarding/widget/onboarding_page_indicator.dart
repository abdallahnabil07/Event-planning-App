
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPageIndicator extends StatelessWidget {
  final PageController pageController;

  const OnBoardingPageIndicator({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: context.isDark?AppColors.primaryDark:AppColors.primary,
              dotColor: context.isDark? AppColors.surface:AppColors.textSecondary,
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
