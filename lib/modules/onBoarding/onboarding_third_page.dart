import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/gen/assets.gen.dart';
import 'package:event_app/modules/onBoarding/widget/onboarding_content_card.dart';
import 'package:flutter/material.dart';




class OnBoardingThirdPage extends StatelessWidget {
  final PageController pageController;
  final int index;
  const OnBoardingThirdPage({super.key, required this.pageController, required this.index});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final image = isDark
        ? Assets.images.thirdOnBoardingImageDarkMode
        : Assets.images.thirdOnBoardingImageLightMode;
    return SingleChildScrollView(
      child: Column(
        children: [
          OnBoardingContentCard(
            image: image,
            title: context.appLocalizations.fourthOnBoardingTitle,
            details: context.appLocalizations.fourthOnBoardingDetails,
            pageController: pageController,
            currentIndex: index,
          ),

        ],
      ),
    );
  }
}
