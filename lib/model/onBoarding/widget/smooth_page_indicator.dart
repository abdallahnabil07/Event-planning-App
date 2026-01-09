import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:eventy_app/model/onBoarding/on_boarding_fourth.dart';
import 'package:eventy_app/model/onBoarding/on_boarding_second_page.dart';
import 'package:eventy_app/model/onBoarding/on_boarding_third.dart';
import 'package:eventy_app/model/onBoarding/widget/custom_container_arrow.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatefulWidget {
  const CustomSmoothPageIndicator({super.key});

  @override
  State<CustomSmoothPageIndicator> createState() =>
      _CustomSmoothPageIndicatorState();
}

class _CustomSmoothPageIndicatorState extends State<CustomSmoothPageIndicator> {
  int currentIndex = 0;
  final int totalPage = 3;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              controller: _pageController,
              children: [
                OnBoardingSecondPage(),
                OnBoardingThird(),
                OnBoardingFourth(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: sizeW * 0.048,
              right: sizeW * 0.048,
              bottom: sizeH * 0.013,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainerArrow(
                  onTap: () {
                    if (currentIndex != 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },

                  icons: Icons.arrow_back_rounded,
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.primaryColor,
                    dotColor: AppColors.blackColor,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 4,
                  ),
                ),
                CustomContainerArrow(
                  onTap: () {
                    if (currentIndex < 2) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutesName.signIn,
                      );
                    }
                  },
                  icons: Icons.arrow_forward,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
