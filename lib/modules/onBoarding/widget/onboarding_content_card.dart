import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:event_app/modules/onBoarding/widget/onboarding_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/gen/assets.gen.dart';
import 'page_header_logo.dart';

class OnBoardingContentCard extends StatelessWidget {
  final AssetGenImage image;
  final String title;
  final String details;
  final PageController pageController;
  final int? currentIndex;

  const OnBoardingContentCard({
    super.key,
    required this.image,
    required this.title,
    required this.details,
    required this.pageController,
    this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: context.paddingHeight32),
        PageHeaderLogo(isBoarding: true, currentIndex: currentIndex),
        // image
        Padding(
          padding: EdgeInsets.only(
            top: 58.h,
            left: 16.w,
            right: 16.w,
          ),
          child: SizedBox(
            width: double.infinity,
            child: image.image(fit: BoxFit.cover),
          ),
        ),
        OnBoardingPageIndicator(pageController: pageController),
        // textTitle
        Padding(
          padding: EdgeInsets.only(
            top: 25.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Text(
            textAlign: TextAlign.start,
            title,
            style: context.textTheme.titleLarge!.copyWith(
              color: context.isDark
                  ? AppColors.surface
                  : AppColors.textPrimary,
            ),
          ),
        ),
        // textDetails
        Padding(
          padding: EdgeInsets.only(
            top: 25.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Text(
            textAlign: TextAlign.start,
            details,
            style: context.textTheme.titleMedium!.copyWith(
              color: context.isDark
                  ? AppColors.textHint
                  : AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}