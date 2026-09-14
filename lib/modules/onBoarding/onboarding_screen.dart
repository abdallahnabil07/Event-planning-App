import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/routes/app_routes_name.dart';
import 'package:event_app/core/widgets/components/app_elevated_button.dart';
import 'package:event_app/modules/onBoarding/onboarding_third_page.dart';
import 'package:event_app/modules/onBoarding/onboarding_first_page.dart';
import 'package:event_app/modules/onBoarding/onboarding_second_page.dart';
import 'package:flutter/material.dart';

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
    final isLastPage = _currentIndex == 2;

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
                OnBoardingFirstPage(
                  pageController: _pageController,
                  index: _currentIndex,
                ),
                OnBoardingSecondPage(
                  pageController: _pageController,
                  index: _currentIndex,
                ),
                OnBoardingThirdPage(
                  pageController: _pageController,
                  index: _currentIndex,
                ),
              ],
            ),
          ),
          // ✅ only show button on last page
          if (isLastPage)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.paddingWidth16,
                vertical: context.paddingHeight20,
              ),
              child: AppElevatedButton(
                textButton: context.appLocalizations.get_started,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutesName.signIn,
                        (route) => false,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}