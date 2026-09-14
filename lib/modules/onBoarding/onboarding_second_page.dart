import 'package:event_app/modules/onBoarding/widget/onboarding_content_card.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';
import '../../core/gen/assets.gen.dart';

class OnBoardingSecondPage extends StatelessWidget {
  final PageController pageController;
  final int index;
  const OnBoardingSecondPage({super.key, required this.pageController, required this.index});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final image = isDark
        ? Assets.images.secondOnBoardingImageDarkMode
        : Assets.images.secondOnBoardingImageLightMode;
    return OnBoardingContentCard(
      image: image,
      title: context.appLocalizations.thirdOnBoardingTitle,
      details: context.appLocalizations.thirdOnBoardingDetails,
      pageController: pageController,
    );
  }
}
