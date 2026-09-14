import 'package:event_app/core/app_settings/%20cubit/app_settings_cubit.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/routes/app_routes_name.dart';
import 'package:event_app/core/widgets/appbar_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/gen/assets.gen.dart';

class PageHeaderLogo extends StatelessWidget {
  final bool isBoarding;
  final int? currentIndex;

  const PageHeaderLogo({
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
        // logo
        Center(
          child: Assets.images.logoTopLightMode.image(
            width: 157.w,   // 375 * 0.42 ≈ 157
            height: 45.h,   // 812 * 0.056 ≈ 45
            fit: BoxFit.contain,
          ),
        ),
        // skip
        currentIndex == 2
            ? const SizedBox.shrink()
            : Positioned(
          right: context.watch<AppSettingsCubit>().state.language=='ar'
              ? 300.w   // 375 * 0.80 ≈ 300
              : 0,
          child: AppBarIconButton(
            width: 60.w,                    // 375 * 0.16 ≈ 60
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
        padding: EdgeInsets.only(top: 32.h),  // 812 * 0.04 ≈ 32
        child: Assets.images.logoTopLightMode.image(
          width: 157.w,
          height: 45.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}