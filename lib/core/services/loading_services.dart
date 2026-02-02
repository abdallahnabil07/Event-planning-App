import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 12.0
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = AppColors.whiteColor
    ..indicatorColor = AppColors.primaryColor
    ..textColor = AppColors.lightGreyColor
    ..userInteractions = false
    ..dismissOnTap = false;
}