import 'package:eventy_app/model/onBoarding/widget/custom_image_and_title_and_details.dart';
import 'package:flutter/material.dart';

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
        title: 'Find Events That Inspire You',
        details:
            "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
      ),
    );
  }
}
