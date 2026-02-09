import 'package:eventy_app/modules/onBoarding/widget/custom_image_and_title_and_details.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';
import '../../core/gen/assets.gen.dart';

class ThirdPageOnBoarding extends StatelessWidget {
  final PageController pageController;
  final int index;
  const ThirdPageOnBoarding({super.key, required this.pageController, required this.index});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final image = isDark
        ? Assets.images.thirdOnBoardingImageDarkMode
        : Assets.images.thirdOnBoardingImageLightMode;
    return CustomImageAndTitleAndDetails(
      image: image,
      title: context.appLocalizations.fourthOnBoardingTitle,
      details: context.appLocalizations.fourthOnBoardingDetails,
      pageController: pageController,
      currentIndex: index,
    );
  }
}
