import 'package:eventy_app/core/extensions/context_extensions.dart';
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
    final isDark = Theme
        .of(context)
        .brightness == Brightness.dark;
    final image = isDark
        ? Assets.images.forgotPasswordImageDark
        : Assets.images.forgotPasswordImageLight;
    final backgroundColorContainer = isDark
        ? AppColors.strokeDarkModeColor
        : AppColors.whiteColor;
    final backgroundColorContainerBorder = isDark
        ? AppColors.mainDarkModeColor
        : AppColors.whiteColorBorder;
    final arrowColor = isDark
        ? AppColors.whiteColor
        : AppColors.primaryColor;

    final sizeW = context.width;
    final sizeH = context.height;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
            child: SizedBox(
              width: context.paddingWidth24,
              height: context.paddingHeight24,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: backgroundColorContainer,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: backgroundColorContainerBorder,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      size: 18,
                      color: arrowColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
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
