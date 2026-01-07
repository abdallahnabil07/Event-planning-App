import 'package:eventy_app/model/onBoarding/widget/custom_image_and_title_and_details.dart';
import 'package:flutter/material.dart';

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
        title: 'Effortless Event Planning',
        details:
            "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
      ),
    );
  }
}
