import 'package:eventy_app/components/custom_elevated_button.dart';
import 'package:eventy_app/components/custom_text_field.dart';

import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:eventy_app/modules//onBoarding/widget/custom_text_top_sign_in_up.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';
import '../../core/gen/assets.gen.dart';
import '../../custom_widget/custom_appbar_sign_in_up.dart';
import '../../custom_widget/custom_google_elevated_button.dart';
import '../../custom_widget/custom_or_word_sign_in_up.dart';
import '../../custom_widget/rich_text_sign_up_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery
        .of(context)
        .size
        .width;
    final sizeH = MediaQuery
        .of(context)
        .size
        .height;
    final theme = Theme
        .of(context)
        .textTheme;
    final isDark = Theme
        .of(context)
        .brightness == Brightness.dark;
    final textColorDontHaveAccount = isDark
        ? AppColors.lightGreyColor
        : AppColors.darkGreyColor;
    final textColor = isDark
        ? AppColors.primaryColor
        : AppColors.secondDarkModeColor;
    final colorElevatedButton = isDark
        ? AppColors.mainDarkModeColor
        : AppColors.primaryColor;


    return Scaffold(
      appBar: CustomAppBarSignInUp(),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextTopSignInUp(
                text: context.appLocalizations.loginToYourAccount),
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
                      color: textColor,
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
                backgroundColor: colorElevatedButton,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutesName.homeScreen,
                        (route) => false,
                  );
                },
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
              secondTextColor: textColor,
            ),
            //or
            CustomOrWordSignInUp(),
            //elevated button google
            CustomGoogleElevatedButton(
              textButton: context.appLocalizations.loginByGoogle,),
          ],
        ),
      ),
    );
  }
}
