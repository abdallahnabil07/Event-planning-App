import 'package:eventy_app/model/onBoarding/widget/custom_image_and_title_and_details.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/media_query_and_theme_localizations_extensions.dart';
import '../../core/gen/assets.gen.dart';

class OnBoardingThird extends StatefulWidget {
  const OnBoardingThird({super.key});

  @override
  State<OnBoardingThird> createState() => _OnBoardingThirdState();
}

class _OnBoardingThirdState extends State<OnBoardingThird> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final image = isDark
        ? Assets.images.thirdImageOfIntro3Dark
        : Assets.images.thirdImageOfIntro3;
    return Scaffold(
      body: CustomImageAndTitleAndDetails(
        image: image,
        title: context.appLocalizations.thirdOnBoardingTitle,
        details: context.appLocalizations.thirdOnBoardingDetails,
      ),
    );
  }
}
