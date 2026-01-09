import 'package:eventy_app/model/onBoarding/widget/custom_image_and_title_and_details.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/media_query_and_theme_localizations_extensions.dart';
import '../../core/gen/assets.gen.dart';

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
        title: context.appLocalizations.fourthOnBoardingTitle,
        details: context.appLocalizations.fourthOnBoardingDetails,
      ),
    );
  }
}
