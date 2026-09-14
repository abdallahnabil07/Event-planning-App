import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/gen/assets.gen.dart';
import 'package:event_app/core/utils/validators.dart';
import 'package:event_app/core/widgets/appbar_icon_button.dart';
import 'package:event_app/core/widgets/components/app_elevated_button.dart';
import 'package:event_app/core/widgets/components/app_text_field.dart';
import 'package:event_app/core/widgets/components/toastification_custom.dart';
import 'package:event_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:event_app/features/auth/presentation/utils/auth_error_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final image = context.isDark
        ? Assets.images.forgotPasswordImageDark
        : Assets.images.forgotPasswordImageLight;

    return Scaffold(
      appBar: AppBar(
        leading: AppBarIconButton(
          width: context.paddingWidth28,
          height: context.paddingHeight28,
          onTap: () => Navigator.pop(context),
        ),
        title: Text(context.appLocalizations.resetPassword),
      ),
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
            ToastificationCustom.show(
              context,
              title: context.appLocalizations.check_your_email,
              type: ToastificationType.success,
            );
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return SingleChildScrollView(
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  image.image(),
                  // email
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    child: AppTextField(
                      controller: _emailController,
                      validator: (value) => Validators.email(context, value),
                      hintText: context.appLocalizations.email,
                      icon: Assets.icons.emailIcon,
                    ),
                  ),
                  // reset button
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 18.h,
                    ),
                    child: AppElevatedButton(
                      textButton: context.appLocalizations.resetPassword,
                      onPressed: isLoading
                          ? null
                          : () {
                        if (_globalKey.currentState!.validate()) {
                          context.read<AuthCubit>().forgetPassword(
                            _emailController.text,
                          );
                        }
                      },
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