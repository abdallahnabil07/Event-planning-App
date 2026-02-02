import 'package:eventy_app/components/custom_elevated_button.dart';
import 'package:eventy_app/components/custom_text_field.dart';

import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:eventy_app/core/utils/firebase_auth_utils.dart';
import 'package:eventy_app/modules//onBoarding/widget/custom_text_top_sign_in_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:toastification/toastification.dart';

import '../../core/enums/auth_error.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/gen/assets.gen.dart';
import '../../core/l10n/app_localizations.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  AppLocalizations get appLocalizations => AppLocalizations.of(context)!;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    final theme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
        child: Form(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextTopSignInUp(
                text: context.appLocalizations.loginToYourAccount,
              ),
              //email
              Padding(
                padding: EdgeInsets.only(
                  left: sizeW * 0.041,
                  right: sizeW * 0.041,
                  top: sizeH * 0.027,
                  bottom: sizeH * 0.018,
                ),
                child: CustomTextField(
                  validator: validate,
                  controller: _emailController,
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
                  validator: validate,
                  hintText: context.appLocalizations.password,
                  icon: Assets.icons.lockIcon,
                  isPassword: true,
                  controller: _passwordController,
                ),
              ),
              //forget password
              Padding(
                padding: EdgeInsets.only(right: sizeW * 0.041),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutesName.forgetPassword,
                      );
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
                  onPressed: () async {
                    if (_globalKey.currentState!.validate()) {
                      EasyLoading.show();
                      final error =
                          await FirebaseAuthUtils.signInWithEmailAndPassword(
                            _emailController.text,
                            _passwordController.text,
                          );
                      if (!mounted) return;
                      if (error != null) {
                        EasyLoading.dismiss();
                        String message;
                        switch (error) {
                          case AuthError.invalidCredential:
                            message = appLocalizations.no_user_found;
                            break;
                          case AuthError.weakPassword:
                            message = appLocalizations.weak_password;
                            break;
                          case AuthError.wrongPassword:
                            message = appLocalizations.wrong_password;
                            break;
                          default:
                            message = appLocalizations.something_went_wrong;
                        }
                        toastification.show(
                          title: Text(message),
                          type: ToastificationType.error,
                          autoCloseDuration: Duration(seconds: 5),
                          alignment: Alignment.bottomCenter,
                        );
                      } else {
                        EasyLoading.dismiss();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutesName.homeScreen,
                          (route) => false,
                        );
                      }

                      // ).then((value) {
                      //   EasyLoading.dismiss();
                      //   if (value) {
                      //     Navigator.pushNamedAndRemoveUntil(
                      //       context,
                      //       AppRoutesName.homeScreen,
                      //       (route) => false,
                      //     );
                      //   }
                      // });
                    }
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
                textButton: context.appLocalizations.loginByGoogle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.appLocalizations.required;
    }
    return null;
  }
}
