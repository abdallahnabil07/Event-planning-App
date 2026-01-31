import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:eventy_app/modules//layout/profile/widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '/core/extensions/context_extensions.dart';
import '/core/theme/app_colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //image
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 42),
                width: 104,
                height: 104,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: Assets.images.me.provider(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //nameUser
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                context.appLocalizations.abdullahNabil,
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge!.copyWith(
                  color: context.isDark
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            //emailUSer
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                "abdallahnabil770@gmail.com",
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium!.copyWith(
                  fontSize: 14,
                  color: context.isDark
                      ? AppColors.lightGreyColor
                      : AppColors.darkGreyColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: context.paddingHeight32),
            CustomContainer(
              text: context.appLocalizations.darkMode,
              widget: Switch(
                activeThumbColor: AppColors.whiteColor,
                activeTrackColor: context.isDark
                    ? AppColors.mainDarkModeColor
                    : AppColors.strokeDarkModeColor,
                inactiveThumbColor: AppColors.whiteColor,
                inactiveTrackColor: context.isDark
                    ? AppColors.secondDarkModeColor
                    : AppColors.greyColor,
                value: isDark,
                onChanged: (value) {
                  setState(() {
                    isDark=value;
                  });

                },
              ),
            ),
            CustomContainer(
              text: context.appLocalizations.language,
              widget: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.paddingWidth16),
                child: Bounceable(
                  onTap: () {},
                  child: Assets.icons.arrowRight.svg(
                    width: context.paddingWidth28,
                    height: context.paddingHeight28,
                    colorFilter: ColorFilter.mode(
                      context.isDark
                          ? AppColors.mainDarkModeColor
                          : AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
            CustomContainer(
              text: context.appLocalizations.logout,
              widget: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.paddingWidth16,
                ),
                child: Bounceable(
                  onTap: () {},
                  child: Assets.icons.logout.svg(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
