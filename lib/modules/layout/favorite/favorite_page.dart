import 'package:eventy_app/components/custom_text_field.dart';
import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: SizedBox(
            width: double.infinity,
            height: 48,
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: CustomTextField(
                hintText: "Search for event",
                fillColor: context.isDark
                    ? AppColors.secondDarkModeColor
                    : AppColors.whiteColor,
                borderColor: context.isDark
                    ? AppColors.strokeDarkModeColor
                    : AppColors.whiteColorBorder,
                iconPosition: IconPosition.end,
                icon: Assets.icons.search,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
