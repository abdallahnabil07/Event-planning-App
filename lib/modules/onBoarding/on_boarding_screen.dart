import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/modules/onBoarding/third_page_on_boarding.dart';
import 'package:eventy_app/modules/onBoarding/first_page_on_boarding.dart';
import 'package:eventy_app/modules/onBoarding/second_page_on_boarding.dart';
import 'package:flutter/material.dart';

import '../../components/custom_elevated_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              controller: _pageController,
              children: [
                FirstPageOnBoarding(
                  pageController: _pageController,
                  index: _currentIndex,
                ),
                SecondPageOnBoarding(
                  pageController: _pageController,
                  index: _currentIndex,
                ),
                ThirdPageOnBoarding(
                  pageController: _pageController,
                  index: _currentIndex,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.paddingWidth16,
              vertical: context.paddingHeight20,
            ),
            child: CustomElevatedButton(
              textButton: _currentIndex == 2
                  ? context.appLocalizations.get_started
                  : context.appLocalizations.next,
              onPressed: () {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 250),
                    curve: Curves.linear);
                if (_currentIndex == 2) {
                  Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutesName.signIn, (route) => false,);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
