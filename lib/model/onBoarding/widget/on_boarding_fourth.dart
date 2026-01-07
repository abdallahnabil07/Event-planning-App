import 'package:eventy_app/model/onBoarding/widget/custom_image_and_title_and_details.dart';
import 'package:flutter/material.dart';

import '../../../core/gen/assets.gen.dart';

class OnBoardingFourth extends StatefulWidget {
  const OnBoardingFourth({super.key});

  @override
  State<OnBoardingFourth> createState() => _OnBoardingFourthState();
}

class _OnBoardingFourthState extends State<OnBoardingFourth> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final image = isDark
        ? Assets.images.fourthImageOfIntro4Dark
        : Assets.images.fourthImageOfIntro4;
    return Scaffold(
      body: CustomImageAndTitleAndDetails(
        image: image,
        title: 'Connect with Friends & Share Moments',
        details:
            "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
      ),
    );
  }
}
