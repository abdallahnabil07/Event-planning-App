import 'package:event_app/core/theme/app_colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 12.0
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = AppColors.surface
    ..indicatorColor = AppColors.primary
    ..textColor = AppColors.textHint
    ..userInteractions = false
    ..dismissOnTap = false;
}