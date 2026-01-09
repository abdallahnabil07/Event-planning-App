import 'package:eventy_app/components/custom_elevated_button.dart';
import 'package:eventy_app/components/custom_text_field.dart';
import 'package:eventy_app/core/extensions/media_query_and_theme_extensions.dart';
import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/routes/app_routes_name.dart';
import '../../custom_widget/custom_full_logo_top_page.dart';
import '../../custom_widget/rich_text_sign_up_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final theme = context.textTheme;
    final sizeW = context.width;
    final sizeH = context.height;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColorAlreadyHaveAccount = isDark
        ? AppColors.whiteColor
        : AppColors.blackColor;
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomFullLogoTopPage(),
          //name
          Padding(
            padding: EdgeInsets.only(
              left: sizeW * 0.041,
              right: sizeW * 0.041,
              bottom: sizeH * 0.018,
            ),
            child: CustomTextField(
              hintText: "Name",
              icon: Assets.icons.personIcon,
            ),
          ),
          //email
          Padding(
            padding: EdgeInsets.only(
              left: sizeW * 0.041,
              right: sizeW * 0.041,
              bottom: sizeH * 0.018,
            ),
            child: CustomTextField(
              hintText: "Email",
              icon: Assets.icons.emailIcon,
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
              hintText: "Password",
              icon: Assets.icons.lockIcon,
              isPassword: true,
            ),
          ),
          //re password
          Padding(
            padding: EdgeInsets.only(left: sizeW * 0.041, right: sizeW * 0.041),
            child: CustomTextField(
              hintText: "Re Password",
              icon: Assets.icons.lockIcon,
              isPassword: true,
            ),
          ),
          //elevated button
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sizeW * 0.041,
              vertical: sizeH * 0.022,
            ),
            child: CustomElevatedButton(
              textButton: "Create Account",
              backgroundColor: AppColors.primaryColor,
              onPressed: () {},
            ),
          ),
          //already have account
          RichTextSignUpIn(
            firstText: "Already Have Account? ",
            secondText: 'Login',
            onPressed: () {
              Navigator.pushNamed(context, AppRoutesName.signIn);
            },
            firstTextColor: textColorAlreadyHaveAccount,
            secondTextColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
