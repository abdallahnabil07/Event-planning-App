import 'package:event_app/core/app_settings/%20cubit/app_settings_cubit.dart';
import 'package:event_app/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

extension ContextExtensions on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  bool get isLight => Theme.of(this).brightness == Brightness.light;

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  // ✅ now powered by ScreenUtil
  double hg(double n) => n.h;
  double wd(double n) => n.w;

  AppLocalizations get appLocalizations => AppLocalizations.of(this)!;
  AppSettingsCubit get settings => read<AppSettingsCubit>();
  AppSettingsState get settingsState => watch<AppSettingsCubit>().state;

  double get paddingHeight4 => 4.h;
  double get paddingHeight6 => 6.h;
  double get paddingHeight8 => 8.h;
  double get paddingHeight10 => 10.h;
  double get paddingHeight12 => 12.h;
  double get paddingHeight14 => 14.h;
  double get paddingHeight16 => 16.h;
  double get paddingHeight18 => 18.h;
  double get paddingHeight20 => 20.h;
  double get paddingHeight22 => 22.h;
  double get paddingHeight24 => 24.h;
  double get paddingHeight26 => 26.h;
  double get paddingHeight28 => 28.h;
  double get paddingHeight30 => 30.h;
  double get paddingHeight32 => 32.h;
  double get paddingHeight34 => 34.h;

  double get paddingWidth4 => 4.w;
  double get paddingWidth6 => 6.w;
  double get paddingWidth8 => 8.w;
  double get paddingWidth10 => 10.w;
  double get paddingWidth12 => 12.w;
  double get paddingWidth14 => 14.w;
  double get paddingWidth16 => 16.w;
  double get paddingWidth18 => 18.w;
  double get paddingWidth20 => 20.w;
  double get paddingWidth22 => 22.w;
  double get paddingWidth24 => 24.w;
  double get paddingWidth26 => 26.w;
  double get paddingWidth28 => 28.w;
  double get paddingWidth30 => 30.w;
  double get paddingWidth32 => 32.w;
  double get paddingWidth34 => 34.w;
  double get paddingWidth36 => 36.w;

  TextTheme get textTheme => Theme.of(this).textTheme;
}