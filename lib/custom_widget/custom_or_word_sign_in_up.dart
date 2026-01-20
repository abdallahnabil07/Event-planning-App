import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class CustomOrWordSignInUp extends StatelessWidget {
  const CustomOrWordSignInUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.041,
        vertical: context.height * 0.022,
      ),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: AppColors.primaryColor,
              thickness: 2,
              endIndent: 20,
              indent: 20,
            ),
          ),
          Text(
            context.appLocalizations.or,
            style: context.textTheme.titleMedium!.copyWith(
              color: AppColors.mainDarkModeColor,
            ),
          ),
          Expanded(
            child: Divider(
              color: AppColors.primaryColor,
              thickness: 2,
              endIndent: 20,
              indent: 20,
            ),
          ),
        ],
      ),
    );
  }
}
