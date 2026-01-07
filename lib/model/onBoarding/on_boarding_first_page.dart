import 'package:eventy_app/components/custom_elevated_button.dart';
import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:eventy_app/model/onBoarding/widget/custom_logo_top_page.dart';
import 'package:flutter/material.dart';

import 'widget/custom_switch_theme_language.dart';

class OnBoardingFirstPage extends StatefulWidget {
  const OnBoardingFirstPage({super.key});

  @override
  State<OnBoardingFirstPage> createState() => _OnBoardingFirstPageState();
}

class _OnBoardingFirstPageState extends State<OnBoardingFirstPage> {
  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    final theme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final image = isDark
        ? Assets.images.firstImageOfIntro1Dark
        : Assets.images.firstImageOfIntro1;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomLogoTopPage(),
          Padding(
            padding: EdgeInsets.only(
              top: sizeH * 0.072,
              left: sizeW * 0.041,
              right: sizeW * 0.041,
            ),
            child: SizedBox(
              width: sizeW * 0.92,
              height: sizeH * 0.41,
              child: image.image(fit: BoxFit.contain),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: sizeH * 0.031,
              left: sizeW * 0.041,
              right: sizeW * 0.041,
            ),
            child: SizedBox(
              height: sizeH * 0.027,
              child: Text(
                textAlign: TextAlign.start,
                "Personalize Your Experience",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: sizeH * 0.031,
              left: sizeW * 0.041,
              right: sizeW * 0.041,
            ),
            child: Text(
              textAlign: TextAlign.start,
              "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          // SizedBox(height: 8),
          CustomSwitchThemeLanguage(
            textTitle: "Language",
            rightImage: Assets.images.usa,
            backGroundColor: AppColors.primaryColor,
            onTop: () {},
            leftImage: Assets.images.eg,
          ),
          CustomSwitchThemeLanguage(
            textTitle: "Theme",
            rightImage: Assets.images.sunLightMood,
            backGroundColor: AppColors.redColor,
            onTop: () {},
            leftImage: Assets.images.moonDarkMode,
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sizeW * 0.041,
              vertical: sizeH * 0.031,
            ),
            child: CustomElevatedButton(
              textButton: "Let's Start",
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutesName.onBoardingSecondPage,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
