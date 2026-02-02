import 'package:eventy_app/components/custom_elevated_button.dart';
import 'package:eventy_app/components/custom_text_field.dart';
import 'package:eventy_app/core/enums/auth_error.dart';
import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:eventy_app/core/utils/firebase_auth_utils.dart';
import 'package:eventy_app/custom_widget/custom_appbar_sign_in_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:toastification/toastification.dart';

import '../../core/l10n/app_localizations.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  AppLocalizations get appLocalizations => AppLocalizations.of(context)!;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColorAlreadyHaveAccount = isDark
        ? AppColors.lightGreyColor
        : AppColors.darkGreyColor;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBarSignInUp(),
      body: Form(
        key: _globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextTopSignInUp(
              text: context.appLocalizations.createYourAccount,
            ),
            //name
            Padding(
              padding: EdgeInsets.only(
                left: context.width * 0.041,
                right: context.width * 0.041,
                bottom: context.height * 0.018,
              ),
              child: CustomTextField(
                validator: nameValidate,
                controller: _nameController,
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
                controller: _emailController,
                validator: emailValidate,
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
                controller: _passwordController,
                validator: passwordValidate,
                hintText: context.appLocalizations.password,
                icon: Assets.icons.lockIcon,
                isPassword: true,
              ),
            ),
            //re password
            Padding(
              padding: EdgeInsets.only(
                left: context.width * 0.041,
                right: context.width * 0.041,
              ),
              child: CustomTextField(
                controller: _rePasswordController,
                validator: rePasswordValidate,
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
                onPressed: () async {
                  if (_globalKey.currentState!.validate()) {
                    EasyLoading.show();
                    final error =
                        await FirebaseAuthUtils.signUpWithEmailAndPassword(
                          _emailController.text,
                          _passwordController.text,
                        );
                    if (!mounted) return;
                    if (error != null) {
                      EasyLoading.dismiss();
                      String message;
                      switch (error) {
                        case AuthError.invalidCredential:
                          message = appLocalizations.invalid_email;
                          break;
                        case AuthError.emailAlreadyInUse:
                          message = appLocalizations.email_already_in_use;
                          break;
                        case AuthError.weakPassword:
                          message = appLocalizations.weak_password;
                          break;
                        default:
                          message = appLocalizations.something_went_wrong;
                      }
                      toastification.show(
                        alignment: Alignment.bottomCenter,
                        title: Text(message),
                        type: ToastificationType.error,
                        autoCloseDuration: Duration(seconds: 5),
                      );
                    }

                    // ).then((value) {
                    //   EasyLoading.dismiss();
                    //   if (value) {
                    //     toastification.show(
                    //       title: Text("Account Created successfully"),
                    //       type: ToastificationType.success,
                    //       autoCloseDuration: Duration(seconds: 5),
                    //     );
                    //   }
                    // });
                    EasyLoading.dismiss();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutesName.homeScreen,
                      (route) => false,
                    );
                  }
                },
              ),
            ),
            //already have account
            RichTextSignUpIn(
              firstText: appLocalizations.alreadyHaveAccount,
              secondText: context.appLocalizations.login,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesName.signIn);
              },
              firstTextColor: textColorAlreadyHaveAccount,
              secondTextColor: AppColors.primaryColor,
            ),
            CustomOrWordSignInUp(),
            CustomGoogleElevatedButton(
              textButton: context.appLocalizations.signByGoogle,
            ),
          ],
        ),
      ),
    );
  }

  String? nameValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.appLocalizations.name_required;
    }
    if (value.trim().length < 2) {
      return context.appLocalizations.name_too_short;
    }
    return null;
  }

  String? emailValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.appLocalizations.email_required;
    }
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    if (!emailRegex.hasMatch(value.trim())) {
      return context.appLocalizations.invalid_email;
    }
    return null;
  }

  String? passwordValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.appLocalizations.password_required;
    }
    final passwordRegex = RegExp(r'^.{6,}$');
    if (!passwordRegex.hasMatch(value.trim())) {
      return context.appLocalizations.invalid_password;
    }
    return null;
  }

  String? rePasswordValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.appLocalizations.repassword_required;
    }
    if (_rePasswordController.text != _passwordController.text) {
      return context.appLocalizations.passwords_not_match;
    }
    return null;
  }
}
