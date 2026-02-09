import 'package:eventy_app/modules/onBoarding/widget/custom_drop_button_theme_language.dart';
import 'package:eventy_app/modules/onBoarding/widget/custom_logo_top_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/custom_elevated_button.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/gen/assets.gen.dart';
import '../../core/routes/app_routes_name.dart';
import '../../core/theme/app_colors.dart';
import '../app_provider/app_settings_provider.dart';

class OnBoardingIntroPage extends StatefulWidget {
  const OnBoardingIntroPage({super.key});

  @override
  State<OnBoardingIntroPage> createState() => _OnBoardingIntroPageState();
}

class _OnBoardingIntroPageState extends State<OnBoardingIntroPage> {
  @override
  Widget build(BuildContext context) {
    final appSettingsProvider = Provider.of<AppSettingsProvider>(context);
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final image = isDark
        ? Assets.images.firstImageOfIntro1DarkChange.image(fit: BoxFit.contain)
        : Assets.images.firstImageOfIntro1LightChange.image(
            fit: BoxFit.contain,
          );
    final moonIcon = isDark ? Assets.icons.moonDarkMode : Assets.icons.moon;
    final containerColorLightModeSelected = isDark
        ? AppColors.mainDarkModeColor
        : AppColors.strokeDarkModeColor;
    final containerColorLightModeUnSelected = isDark
        ? AppColors.secondDarkModeColor
        : AppColors.whiteColor;
    final textColorTitle = isDark ? AppColors.whiteColor : AppColors.blackColor;
    final textColorDetails = isDark
        ? AppColors.lightGreyColor
        : AppColors.darkGreyColor;
    final textColorLanguageAndTheme = isDark
        ? AppColors.whiteColor
        : AppColors.strokeDarkModeColor;
    final isLightSelected = appSettingsProvider.currentTheme == ThemeMode.light;

    final lightTextColor = isLightSelected
        ? (isDark ? AppColors.whiteColor : AppColors.strokeDarkModeColor)
        : AppColors.whiteColor;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomLogoTopPage(),
          //image
          Padding(
            padding: EdgeInsets.only(
              top: context.paddingHeight16,
              left: context.paddingWidth4,
              right: context.paddingWidth4,
            ),
            child: SizedBox(
              width: sizeW * 0.92,
              height: sizeH * 0.48,
              child: image,
            ),
          ),
          //title
          Padding(
            padding: EdgeInsets.only(
              top: sizeH * 0.031,
              left: sizeW * 0.041,
              right: sizeW * 0.041,
            ),
            child: SizedBox(
              child: Text(
                textAlign: TextAlign.start,
                context.appLocalizations.firstOnBoardingTitle,
                style: context.textTheme.titleLarge!.copyWith(
                  color: textColorTitle,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          //details
          Padding(
            padding: EdgeInsets.only(
              top: sizeH * 0.031,
              left: sizeW * 0.041,
              right: sizeW * 0.041,
            ),
            child: Text(
              textAlign: TextAlign.start,
              context.appLocalizations.firstOnBoardingDetails,
              style: context.textTheme.titleMedium!.copyWith(
                color: textColorDetails,
              ),
            ),
          ),
          //language
          Padding(
            padding: EdgeInsets.only(
              top: context.paddingHeight18,
              left: sizeW * 0.041,
              right: sizeW * 0.041,
              bottom: sizeH * 0.018,
            ),
            child: CustomDropButtonThemeLanguage(
              firstItemSelectedTextColor: lightTextColor,
              secondItemTextColor: lightTextColor,
              titleTextColor: textColorLanguageAndTheme,
              currentValue: appSettingsProvider.currentLanguage,
              colorSelected: containerColorLightModeSelected,
              colorUnSelected: containerColorLightModeUnSelected,
              titleText: context.appLocalizations.language,
              firstItemText: context.appLocalizations.english,
              secondItemText: context.appLocalizations.arabic,
              isIcon: false,
              firstItemTextValue: "en",
              secondItemTextValue: "ar",
              onChanged: (value) {
                appSettingsProvider.changeLanguage(value!);
              },
            ),
          ),
          //theme
          Padding(
            padding: EdgeInsets.only(
              left: context.paddingWidth16,
              right: context.paddingWidth16,
              bottom: context.paddingHeight28,
            ),
            child: CustomDropButtonThemeLanguage(
              titleTextColor: textColorLanguageAndTheme,
              currentValue: appSettingsProvider.currentTheme == ThemeMode.light
                  ? "light"
                  : "dark",
              titleText: context.appLocalizations.theme,
              isIcon: true,
              firstIcon: Assets.icons.sun,
              secondIcon: moonIcon,
              colorImage: AppColors.whiteColor,
              colorSelected: containerColorLightModeSelected,
              colorUnSelected: containerColorLightModeUnSelected,
              firstItemTextValue: "light",
              secondItemTextValue: "dark",
              onChanged: (String? value) {
                if (value == "dark") {
                  appSettingsProvider.changeTheme(ThemeMode.dark);
                } else if (value == "light") {
                  appSettingsProvider.changeTheme(ThemeMode.light);
                } else {
                  appSettingsProvider.changeTheme(ThemeMode.system);
                }
              },
            ),
          ),
          //elevated button
          Padding(
            padding: EdgeInsets.only(
              left: sizeW * 0.041,
              right: sizeW * 0.041,
              // bottom: sizeH * 0.08,
            ),
            child: CustomElevatedButton(
              textButton: context.appLocalizations.letsStart,
              backgroundColor: containerColorLightModeSelected,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutesName.onBoardingScreen,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
