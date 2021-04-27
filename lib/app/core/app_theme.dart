import 'package:flutter/material.dart';
import 'package:nti_calls_web/app/core/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeLight = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.WHITE,
    primaryColor: AppColors.BLUE,
    dividerColor: Colors.transparent,
  );

  static ThemeData themeDark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.BLACK,
    primaryColor: AppColors.BLUE,
    dividerColor: Colors.transparent,
  );
}
