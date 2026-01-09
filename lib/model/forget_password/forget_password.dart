import 'package:eventy_app/core/extensions/media_query_and_theme_extensions.dart';
import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../components/custom_elevated_button.dart';
import '../../core/theme/app_colors.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final sizeW = context.width;
    final sizeH = context.height;
    return Scaffold(
      appBar: AppBar(title: Text("Forget Password")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Assets.images.forgotPasswordImage.image(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sizeW * 0.041,
              vertical: sizeH * 0.022,
            ),
            child: CustomElevatedButton(
              textButton: "Reset Password",
              backgroundColor: AppColors.primaryColor,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
