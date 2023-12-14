import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppThemes {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.greenColor,
    primaryColor: AppColors.greenColor,
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.greenColor,
    primaryColor: AppColors.greenColor,
  );

}
