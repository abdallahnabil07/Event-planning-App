import 'package:eventy_app/modules/onBoarding/widget/custom_image_and_title_and_details.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';
import '../../core/gen/assets.gen.dart';

class SecondPageOnBoarding extends StatelessWidget {
  final PageController pageController;
  final int index;
  const SecondPageOnBoarding({super.key, required this.pageController, required this.index});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final image = isDark
        ? Assets.images.secondOnBoardingImageDarkMode
        : Assets.images.secondOnBoardingImageLightMode;
    return CustomImageAndTitleAndDetails(
      image: image,
      title: context.appLocalizations.thirdOnBoardingTitle,
      details: context.appLocalizations.thirdOnBoardingDetails,
      pageController: pageController,
    );
  }
}
