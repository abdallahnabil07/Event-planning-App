import 'package:eventy_app/components/custom_elevated_button.dart';
import 'package:eventy_app/components/custom_text_field.dart';
import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:eventy_app/custom_widget/custom_full_logo_top_page.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/media_query_and_theme_localizations_extensions.dart';
import '../../core/gen/assets.gen.dart';
import '../../custom_widget/rich_text_sign_up_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    final theme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColorDontHaveAccount = isDark
        ? AppColors.whiteColor
        : AppColors.blackColor;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomFullLogoTopPage(),
          //email
          Padding(
            padding: EdgeInsets.only(
              left: sizeW * 0.041,
              right: sizeW * 0.041,
              top: sizeH * 0.027,
              bottom: sizeH * 0.018,
            ),
            child: CustomTextField(
              hintText: context.appLocalizations.email,
              icon: Assets.icons.emailIcon,
              isPassword: false,
            ),
          ),
          //password
          Padding(
            padding: EdgeInsets.only(
              left: sizeW * 0.041,
              right: sizeW * 0.041,
              bottom: sizeH * 0.018,
            ),
            child: CustomTextField(
              hintText: context.appLocalizations.password,
              icon: Assets.icons.lockIcon,
              isPassword: true,
            ),
          ),
          //forget password
          Padding(
            padding: EdgeInsets.only(right: sizeW * 0.041),
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutesName.forgetPassword);
                },
                child: Text(
                  context.appLocalizations.forgetPassword,
                  style: theme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryColor,
                    decorationThickness: 2,
                  ),
                ),
              ),
            ),
          ),
          //elevated button
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sizeW * 0.041,
              vertical: sizeH * 0.022,
            ),
            child: CustomElevatedButton(
              textButton: context.appLocalizations.login,
              backgroundColor: AppColors.primaryColor,
              onPressed: () {},
            ),
          ),
          //don't have account
          RichTextSignUpIn(
            firstText: context.appLocalizations.dontHaveAccount,
            secondText: context.appLocalizations.createAccount,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutesName.signUp);
            },
            firstTextColor: textColorDontHaveAccount,
            secondTextColor: AppColors.primaryColor,
          ),
          //or
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sizeW * 0.041,
              vertical: sizeH * 0.022,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.primaryColor,
                    thickness: 1,
                    endIndent: 20,
                    indent: 20,
                  ),
                ),
                Text(
                  context.appLocalizations.or,
                  style: theme.titleMedium!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: AppColors.primaryColor,
                    thickness: 1,
                    endIndent: 20,
                    indent: 20,
                  ),
                ),
              ],
            ),
          ),
          //elevated button google
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sizeW * 0.041,
              vertical: sizeH * 0.022,
            ),
            child: CustomElevatedButton(
              textColor: AppColors.primaryColor,
              addIcon: true,
              icon: Assets.icons.googleIcon,
              textButton: context.appLocalizations.lognByGoogle,
              backgroundColor: Colors.transparent,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
