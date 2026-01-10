import 'package:eventy_app/model/onBoarding/widget/custom_image_and_title_and_details.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';
import '../../core/gen/assets.gen.dart';

class OnBoardingSecondPage extends StatefulWidget {
  const OnBoardingSecondPage({super.key});

  @override
  State<OnBoardingSecondPage> createState() => _OnBoardingSecondPageState();
}

class _OnBoardingSecondPageState extends State<OnBoardingSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomImageAndTitleAndDetails(
        image: Assets.images.secondImageOfIntro2,
        title: context.appLocalizations.secondOnBoardingTitle,
        details: context.appLocalizations.secondOnBoardingDetails,
      ),
    );
  }
}
