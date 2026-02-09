import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:flutter/material.dart';

import '../../../custom_widget/app_bar_container_custom.dart';
import '/core/gen/assets.gen.dart';

class CustomLogoTopPage extends StatelessWidget {
  final bool isBoarding;
  final int? currentIndex;

  const CustomLogoTopPage({
    super.key,
    this.isBoarding = false,
    this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return isBoarding
        ? Stack(
            alignment: Alignment.center,
            children: [
              //logo
              Center(
                child: Assets.images.eventlyLogoTopChange.image(
                  width: context.width * 0.42,
                  height: context.height * 0.056,
                  fit: BoxFit.contain,
                ),
              ),
              //skip
              currentIndex == 2
                  ? SizedBox.shrink()
                  : Positioned(
                      right: context.provider.currentLanguage == 'ar'
                          ? context.width * 0.80
                          : 0,
                      child: CustomAppBarContainer(
                        width: context.width * 0.16,
                        height: context.paddingHeight32,
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutesName.signIn,
                            (route) => false,
                          );
                        },
                        icon: Text(context.appLocalizations.skip),
                      ),
                    ),
            ],
          )
        : Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: context.height * 0.04),
              child: Assets.images.eventlyLogoTopChange.image(
                width: context.width * 0.42,
                height: context.height * 0.056,
                fit: BoxFit.contain,
              ),
            ),
          ); //onlyLogo
  }
}
