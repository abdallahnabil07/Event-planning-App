import 'package:eventy_app/components/custom_elevated_button.dart';
import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:eventy_app/model/app_provider/app_settings_provider.dart';
import 'package:eventy_app/model/onBoarding/widget/custom_drop_button_theme_language.dart';
import 'package:eventy_app/model/onBoarding/widget/custom_logo_top_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingFirstPage extends StatefulWidget {
  const OnBoardingFirstPage({super.key});

  @override
  State<OnBoardingFirstPage> createState() => _OnBoardingFirstPageState();
}

class _OnBoardingFirstPageState extends State<OnBoardingFirstPage> {
  @override
  Widget build(BuildContext context) {
    final appSettingsProvider = Provider.of<AppSettingsProvider>(context);
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
          CustomLogoTopPage(),
          //image
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
                style: Theme.of(context).textTheme.titleLarge,
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
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          //language
          Padding(
            padding: EdgeInsets.only(
              left: sizeW * 0.041,
              right: sizeW * 0.041,
              bottom: sizeH * 0.018,
            ),
            child: CustomDropButtonThemeLanguage(
              titleText: context.appLocalizations.language,
              itemImage: Assets.images.eg,
              firstItemText: context.appLocalizations.arabic,
              secondItemText: context.appLocalizations.english,
              firstValueImage: Assets.images.eg,
              secondValueImage: Assets.images.usa,
              firstItemTextValue: "ar",
              secondItemTextValue: "en",
              onChanged: (String? value) {
                appSettingsProvider.changeLanguage(value!);
              },
            ),
          ),
          //theme
          Padding(
            padding: EdgeInsets.only(
              left: sizeW * 0.041,
              right: sizeW * 0.041,
              bottom: sizeH * 0.031,
            ),
            child: CustomDropButtonThemeLanguage(
              colorFirstValueImage: AppColors.darkModeColor,
              colorSecondValueImage: Colors.amber,
              titleText: context.appLocalizations.theme,
              itemImage: Assets.images.sunLightMood,
              colorImage: AppColors.primaryColor,
              firstItemText: context.appLocalizations.darkMode,
              secondItemText: context.appLocalizations.lightMode,
              firstItemTextValue: "dark",
              secondItemTextValue: "light",
              firstValueImage: Assets.images.moonDarkMode,
              secondValueImage: Assets.images.sunLightMood,
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
              bottom: sizeH * 0.019,
            ),
            child: CustomElevatedButton(
              textButton: context.appLocalizations.letsStart,
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutesName.customSmoothPageIndicator,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
