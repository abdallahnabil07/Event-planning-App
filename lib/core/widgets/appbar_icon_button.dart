import 'package:event_app/core/app_settings/%20cubit/app_settings_cubit.dart';
import 'package:event_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarIconButton extends StatelessWidget {
  final Widget? icon;
  final double width;
  final double height;
  final VoidCallback onTap;

  const AppBarIconButton({
    super.key,
    this.icon,
    required this.width,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColorContainer = context.isDark
        ? AppColors.surfaceDark
        : AppColors.surface;
    final backgroundColorContainerBorder = context.isDark
        ? AppColors.borderDark
        : AppColors.borderLight;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingWidth8),
      child: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: Bounceable(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: context.isDark
                        ? AppColors.surfaceDark
                        : AppColors.surface,
                    blurRadius: 20.r,       // ✅
                    spreadRadius: 1.r,      // ✅
                    offset: const Offset(0, 4),
                  ),
                ],
                color: backgroundColorContainer,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: backgroundColorContainerBorder,
                  width: 2.w,
                ),
              ),
              child: Center(child: _buildIcon(context)),
            ),
          ),
        ),
      ),
    );
  }

  Widget? _buildIcon(BuildContext context) {
    final arrowColor = context.isDark
        ? AppColors.surface
        : AppColors.primary;
    if (icon != null) return icon;
    return context.watch<AppSettingsCubit>().state.language == "en"
        ? Assets.icons.arrowLeft.svg(
      width: context.paddingWidth18,
      height: context.paddingHeight18,
      colorFilter: ColorFilter.mode(arrowColor, BlendMode.srcIn),
    )
        : Assets.icons.arrowRight.svg(
      width: context.paddingWidth18,
      height: context.paddingHeight18,
      colorFilter: ColorFilter.mode(arrowColor, BlendMode.srcIn),
    );
  }
}