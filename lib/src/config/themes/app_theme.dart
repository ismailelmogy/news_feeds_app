import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
      fontFamily: AppStrings.fontName,
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.hintColor,
      platform: TargetPlatform.iOS);
}
