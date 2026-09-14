import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/gen/assets.gen.dart';
import 'package:event_app/modules/onBoarding/widget/onboarding_content_card.dart';
import 'package:flutter/material.dart';


class OnBoardingFirstPage extends StatelessWidget {
  final PageController pageController;
  final int index;

  const OnBoardingFirstPage({
    super.key,
    required this.pageController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final image = context.isDark
        ? Assets.images.firstOnBoardingImageDarkMode
        : Assets.images.firstOnBoardingImageLightMode;
    return OnBoardingContentCard(
      image: image,
      title: context.appLocalizations.secondOnBoardingTitle,
      details: context.appLocalizations.secondOnBoardingDetails,
      pageController: pageController,
    );
  }
}
