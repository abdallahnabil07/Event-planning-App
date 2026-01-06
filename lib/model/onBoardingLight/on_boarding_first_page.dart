import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final image = isDark
        ? Assets.images.firstImageOfIntro1Dark
        : Assets.images.firstImageOfIntro1;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: sizeH * 0.04),
              child: Assets.images.eventlyLogoTop.image(
                width: sizeW * 0.42,
                height: sizeH * 0.056,
                fit: BoxFit.contain,
              ),
            ),
          ),
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
        ],
      ),
    );
  }
}
