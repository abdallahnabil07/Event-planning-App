import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:eventy_app/custom_widget/app_bar_container_custom.dart';
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final image = isDark
        ? Assets.images.forgotPasswordImageDark
        : Assets.images.forgotPasswordImageLight;
    final sizeW = context.width;
    final sizeH = context.height;
    return Scaffold(
      appBar: AppBar(
        leading: CustomAppBarContainer(
          width: context.paddingWidth28,
          height: context.paddingHeight28,
          onTap: () {
            Navigator.pop(context);
          },
        ),

        title: Text(context.appLocalizations.resetPassword),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          image.image(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sizeW * 0.041,
              vertical: sizeH * 0.022,
            ),
            child: CustomElevatedButton(
              textButton: context.appLocalizations.resetPassword,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
