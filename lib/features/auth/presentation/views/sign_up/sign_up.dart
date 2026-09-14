import 'package:event_app/core/widgets/auth_appbar.dart';
import 'package:event_app/core/widgets/auth_divider.dart';
import 'package:event_app/core/widgets/auth_rich_text.dart';
import 'package:event_app/core/widgets/components/app_elevated_button.dart';
import 'package:event_app/core/widgets/components/app_text_field.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/gen/assets.gen.dart';
import 'package:event_app/core/routes/app_routes_name.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:event_app/core/utils/validators.dart';
import 'package:event_app/core/widgets/components/toastification_custom.dart';
import 'package:event_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:event_app/features/auth/presentation/utils/auth_error_mapper.dart';
import 'package:event_app/modules/onBoarding/widget/auth_header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

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
    final textColorAlreadyHaveAccount =
    context.isDark ? AppColors.textHint : AppColors.textSecondary;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AuthAppBar(),
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

          return SingleChildScrollView(                 // ✅ added
            physics: const BouncingScrollPhysics(),      // ✅ added
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AuthHeaderText(
                    text: context.appLocalizations.createYourAccount,
                  ),
                  // name
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      bottom: 15.h,
                    ),
                    child: AppTextField(
                      validator: (value) => Validators.name(context, value),
                      controller: _nameController,
                      hintText: context.appLocalizations.name,
                      icon: Assets.icons.personIcon,
                    ),
                  ),
                  // email
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      bottom: 15.h,
                    ),
                    child: AppTextField(
                      controller: _emailController,
                      validator: (value) => Validators.email(context, value),
                      hintText: context.appLocalizations.email,
                      icon: Assets.icons.emailIcon,
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
                      controller: _passwordController,
                      validator: (value) =>
                          Validators.password(context, value),
                      hintText: context.appLocalizations.password,
                      icon: Assets.icons.lockIcon,
                      isPassword: true,
                    ),
                  ),
                  // re password
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppTextField(
                      controller: _rePasswordController,
                      validator: (value) => Validators.rePassword(
                        context,
                        value,
                        _passwordController.text,
                      ),
                      hintText: context.appLocalizations.rePassword,
                      icon: Assets.icons.lockIcon,
                      isPassword: true,
                    ),
                  ),
                  // create account button
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 18.h,
                    ),
                    child: AppElevatedButton(
                      textButton: context.appLocalizations.createAccount,
                      onPressed: isLoading
                          ? null
                          : () {
                        if (_globalKey.currentState!.validate()) {
                          context.read<AuthCubit>().signUp(
                            _emailController.text,
                            _passwordController.text,
                          );
                        }
                      },
                    ),
                  ),
                  // already have account
                  AuthRichText(
                    firstText: context.appLocalizations.alreadyHaveAccount,
                    secondText: context.appLocalizations.login,
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutesName.signIn),
                    firstTextColor: textColorAlreadyHaveAccount,
                    secondTextColor: AppColors.primary,
                  ),
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
                      textButton: context.appLocalizations.signByGoogle,
                      onPressed: isLoading
                          ? null
                          : () => context.read<AuthCubit>().signInWithGoogle(),
                      backgroundColor: context.isDark
                          ? AppColors.backgroundDark
                          : AppColors.borderLight,
                      borderColor: context.isDark
                          ? AppColors.borderDark
                          : AppColors.borderLight,
                      width: 2.w,
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