import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTextThemes {
  static const introTitle = TextStyle(
    fontFamily: "Righteous",
    color: AppColors.white,
    fontSize: 42,
    letterSpacing: 5,
  );

  static const introSubtitle = TextStyle(
    fontFamily: "RaviPrakash",
    color: AppColors.white,
    fontSize: 16,
    letterSpacing: 2,
  );

  static const buttonDefault = TextStyle(
    fontFamily: "Righteous",
    color: AppColors.primary,
    fontSize: 16,
    letterSpacing: 2,
  );

  static const buttonWithSpace = TextStyle(
    fontFamily: "Righteous",
    color: AppColors.white,
    fontSize: 20,
    letterSpacing: 4,
  );

  static const header = TextStyle(
    fontFamily: "Righteous",
    color: AppColors.onPrimary,
    fontSize: 20,
    letterSpacing: 4,
  );
}
