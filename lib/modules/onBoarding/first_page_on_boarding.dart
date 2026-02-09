import 'package:eventy_app/modules/onBoarding/widget/custom_image_and_title_and_details.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';
import '../../core/gen/assets.gen.dart';

class FirstPageOnBoarding extends StatelessWidget {
  final PageController pageController;
  final int index;

  const FirstPageOnBoarding({
    super.key,
    required this.pageController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final image = context.isDark
        ? Assets.images.firstOnBoardingImageDarkMode
        : Assets.images.firstOnBoardingImageLightMode;
    return CustomImageAndTitleAndDetails(
      image: image,
      title: context.appLocalizations.secondOnBoardingTitle,
      details: context.appLocalizations.secondOnBoardingDetails,
      pageController: pageController,
    );
  }
}
