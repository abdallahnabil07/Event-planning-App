import 'package:eventy_app/components/custom_elevated_button.dart';
import 'package:eventy_app/components/custom_text_field.dart';
import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:eventy_app/custom_widget/custom_appbar_sign_in_up.dart';
import 'package:flutter/material.dart';

import '../../core/routes/app_routes_name.dart';
import '../../custom_widget/custom_google_elevated_button.dart';
import '../../custom_widget/custom_or_word_sign_in_up.dart';
import '../../custom_widget/rich_text_sign_up_in.dart';
import '../onBoarding/widget/custom_text_top_sign_in_up.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColorAlreadyHaveAccount = isDark
        ? AppColors.lightGreyColor
        : AppColors.darkGreyColor;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBarSignInUp(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextTopSignInUp(
              text: context.appLocalizations.createYourAccount),
          //name
          Padding(
            padding: EdgeInsets.only(
              left: context.width * 0.041,
              right: context.width * 0.041,
              bottom: context.height * 0.018,
            ),
            child: CustomTextField(
              hintText: context.appLocalizations.name,
              icon: Assets.icons.personIcon,
            ),
          ),
          //email
          Padding(
            padding: EdgeInsets.only(
              left: context.width * 0.041,
              right: context.width * 0.041,
              bottom: context.height * 0.018,
            ),
            child: CustomTextField(
              hintText: context.appLocalizations.email,
              icon: Assets.icons.emailIcon,
            ),
          ),
          //password
          Padding(
            padding: EdgeInsets.only(
              left: context.width * 0.041,
              right: context.width * 0.041,
              bottom: context.height * 0.018,
            ),
            child: CustomTextField(
              hintText: context.appLocalizations.password,
              icon: Assets.icons.lockIcon,
              isPassword: true,
            ),
          ),
          //re password
          Padding(
            padding: EdgeInsets.only(
                left: context.width * 0.041, right: context.width * 0.041),
            child: CustomTextField(
              hintText: context.appLocalizations.rePassword,
              icon: Assets.icons.lockIcon,
              isPassword: true,
            ),
          ),
          //elevated button
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.041,
              vertical: context.height * 0.022,
            ),
            child: CustomElevatedButton(
              textButton: context.appLocalizations.createAccount,
              onPressed: () {},
            ),
          ),
          //already have account
          RichTextSignUpIn(
            firstText: context.appLocalizations.alreadyHaveAccount,
            secondText: context.appLocalizations.login,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutesName.signIn);
            },
            firstTextColor: textColorAlreadyHaveAccount,
            secondTextColor: AppColors.primaryColor,
          ),
          CustomOrWordSignInUp(),
          CustomGoogleElevatedButton(
            textButton: context.appLocalizations.signByGoogle,),

        ],
      ),
    );
  }
}
