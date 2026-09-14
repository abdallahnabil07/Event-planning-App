import 'package:event_app/core/app_settings/%20cubit/app_settings_cubit.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/gen/assets.gen.dart';
import 'package:event_app/core/routes/app_routes_name.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:event_app/core/widgets/components/app_elevated_button.dart';
import 'package:event_app/modules/onBoarding/widget/theme_language_selector.dart';
import 'package:event_app/modules/onBoarding/widget/page_header_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingWelcomePage extends StatelessWidget {
  const OnBoardingWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppSettingsCubit>().state;
    final isDark = state.themeMode == ThemeMode.dark; // ✅ from state directly

    final image = isDark
        ? Assets.images.firstImageOfIntro1DarkChange.image(fit: BoxFit.contain)
        : Assets.images.firstImageOfIntro1LightChange.image(
            fit: BoxFit.contain,
          );
    final moonIcon = isDark ? Assets.icons.moonDarkMode : Assets.icons.moon;

    final containerColorSelected = isDark
        ? AppColors.primaryDark
        : AppColors.primary;
    final containerColorUnSelected = isDark
        ? AppColors.surfaceDark
        : AppColors.surface;
    final selectedTextColor = AppColors.surface;
    final unSelectedTextColor = isDark ? AppColors.surface : AppColors.primary;
    final textColorTitle = isDark ? AppColors.surface : AppColors.textPrimary;
    final textColorDetails = isDark
        ? AppColors.textHint
        : AppColors.textSecondary;
    final textColorLanguageAndTheme = isDark
        ? AppColors.surface
              : AppColors.borderDark;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const PageHeaderLogo(),

          // image
          Padding(
            padding: EdgeInsets.only(
              top: context.paddingHeight16,
              left: context.paddingWidth4,
              right: context.paddingWidth4,
            ),
            child: SizedBox(width: 345.w, height: 390.h, child: image),
          ),
          // title
          Padding(
            padding: EdgeInsets.only(top: 25.h, left: 16.w, right: 16.w),
            child: Text(
              textAlign: TextAlign.start,
              context.appLocalizations.firstOnBoardingTitle,
              style: context.textTheme.titleLarge!.copyWith(
                color: textColorTitle,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // details
          Padding(
            padding: EdgeInsets.only(top: 25.h, left: 16.w, right: 16.w),
            child: Text(
              textAlign: TextAlign.start,
              context.appLocalizations.firstOnBoardingDetails,
              style: context.textTheme.titleMedium!.copyWith(
                color: textColorDetails,
              ),
            ),
          ),
          // language
          Padding(
            padding: EdgeInsets.only(
              top: context.paddingHeight18,
              left: 16.w,
              right: 16.w,
              bottom: 15.h,
            ),
            child: ThemeLanguageSelector(
              titleTextColor: textColorLanguageAndTheme,
              currentValue: state.language,
              colorSelected: containerColorSelected,
              colorUnSelected: containerColorUnSelected,
              titleText: context.appLocalizations.language,
              firstItemText: context.appLocalizations.english,
              secondItemText: context.appLocalizations.arabic,
              isIcon: false,
              firstItemTextValue: "en",
              secondItemTextValue: "ar",
              firstItemSelectedTextColor: selectedTextColor,
              secondItemTextColor: unSelectedTextColor,
              onChanged: (value) {
                context.read<AppSettingsCubit>().changeLanguage(value!);
              },
            ),
          ),
          // theme
          Padding(
            padding: EdgeInsets.only(
              left: context.paddingWidth16,
              right: context.paddingWidth16,
              bottom: context.paddingHeight28,
            ),
            child: ThemeLanguageSelector(
              titleTextColor: textColorLanguageAndTheme,
              currentValue: state.themeModeValue,
              titleText: context.appLocalizations.theme,
              isIcon: true,
              firstIcon: Assets.icons.sun,
              secondIcon: moonIcon,
              colorSelected: containerColorSelected,
              colorUnSelected: containerColorUnSelected,
              firstItemTextValue: "light",
              secondItemTextValue: "dark",
              onChanged: (String? value) {
                if (value == "dark") {
                  context.read<AppSettingsCubit>().changeTheme(ThemeMode.dark);
                } else {
                  context.read<AppSettingsCubit>().changeTheme(ThemeMode.light);
                }
              },
            ),
          ),
          // elevated button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppElevatedButton(
              textButton: context.appLocalizations.letsStart,
              backgroundColor: containerColorSelected,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesName.onBoardingScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
