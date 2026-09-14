import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/gen/assets.gen.dart';
import 'package:event_app/core/routes/app_routes_name.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:event_app/core/utils/validators.dart';
import 'package:event_app/core/widgets/auth_appbar.dart';
import 'package:event_app/core/widgets/auth_divider.dart';
import 'package:event_app/core/widgets/auth_rich_text.dart';
import 'package:event_app/core/widgets/components/app_elevated_button.dart';
import 'package:event_app/core/widgets/components/app_text_field.dart';
import 'package:event_app/core/widgets/components/toastification_custom.dart';
import 'package:event_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:event_app/features/auth/presentation/utils/auth_error_mapper.dart';
import 'package:event_app/modules/onBoarding/widget/auth_header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColorDontHaveAccount =
    context.isDark ? AppColors.textHint : AppColors.textSecondary;
    final textColor =
    context.isDark ? AppColors.primary : AppColors.surfaceDark;
    final colorElevatedButton =
    context.isDark ? AppColors.primaryDark : AppColors.primary;

    return Scaffold(
      appBar: const AuthAppBar(),
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();
          }

          if (state is AuthFailureState) {
            ToastificationCustom.show(
              context,
              title: mapAuthErrorToMessage(context, state.code),
              type: ToastificationType.error,

            );
          } else if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutesName.homeScreen,
                  (route) => false,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AuthHeaderText(
                    text: context.appLocalizations.loginToYourAccount,
                  ),
                  // email
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      top: 22.h,
                      bottom: 15.h,
                    ),
                    child: AppTextField(
                      validator: (value) => Validators.email(context, value),
                      controller: _emailController,
                      hintText: context.appLocalizations.email,
                      icon: Assets.icons.emailIcon,
                      isPassword: false,
                    ),
                  ),
                  // password
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      bottom: 15.h,
                    ),
                    child: AppTextField(
                      validator: (value) =>
                          Validators.password(context, value),
                      hintText: context.appLocalizations.password,
                      icon: Assets.icons.lockIcon,
                      isPassword: true,
                      controller: _passwordController,
                    ),
                  ),
                  // forget password
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          AppRoutesName.forgetPassword,
                        ),
                        child: Text(
                          context.appLocalizations.forgetPassword,
                          style: context.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: textColor,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primary,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // login button
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 18.h,
                    ),
                    child: AppElevatedButton(
                      textButton: context.appLocalizations.login,
                      backgroundColor: colorElevatedButton,
                      onPressed: isLoading
                          ? null
                          : () {
                        if (_globalKey.currentState!.validate()) {
                          context.read<AuthCubit>().signIn(
                            _emailController.text,
                            _passwordController.text,
                          );
                        }
                      },
                    ),
                  ),
                  // don't have account
                  AuthRichText(
                    firstText: context.appLocalizations.dontHaveAccount,
                    secondText: context.appLocalizations.createAccount,
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutesName.signUp),
                    firstTextColor: textColorDontHaveAccount,
                    secondTextColor: textColor,
                  ),
                  // or
                  const AuthDivider(),
                  // google button
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 17.w,
                      vertical: 24.h,
                    ),
                    child: AppElevatedButton(
                      addIcon: true,
                      icon: Assets.icons.googleIcon,
                      heightIcon: 24.h,
                      widthIcon: 24.w,
                      paddingHorizontalForIcon: 16.w,
                      paddingVerticalForIcon: 12.h,
                      textButton: context.appLocalizations.loginByGoogle,
                      onPressed: isLoading
                          ? null
                          : () => context.read<AuthCubit>().signInWithGoogle(),
                      backgroundColor: context.isDark
                          ? AppColors.backgroundDark
                          : AppColors.borderLight,
                      borderColor: context.isDark
                          ? AppColors.borderDark
                          : AppColors.borderLight,
                      width: 2,
                      textColor: context.isDark
                          ? AppColors.primaryDark
                          : AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}