import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/hex_color.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: AppStrings.fontName,
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.hintColor,
    platform: TargetPlatform.iOS,
    // appBarTheme: const AppBarTheme(
    //   elevation: 0,
    //   backgroundColor: Colors.white,
    //   titleTextStyle: TextStyle(
    //       fontFamily: AppStrings.fontName,
    //       color: Colors.black,
    //       fontWeight: FontWeight.w500,
    //       fontSize: 20),
    // ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          elevation: 0,
          textStyle: const TextStyle(
              fontFamily: AppStrings.fontName,
              fontWeight: FontWeight.w500,
              fontSize: 14)),
    ),
    textTheme: TextTheme(

        // style of hint of text form field (mobile)
        titleSmall: TextStyle(
            color: HexColor('949494'),
            fontSize: 16,
            fontWeight: FontWeight.w400),

        // style of button
        labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: HexColor('#151514')),

        // style of most popular and categories
        labelMedium: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),

        // style of text form field (mobile)
        labelSmall: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w300),

        // style of login label
        bodyLarge: const TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),

        // style of login subtitle
        bodyMedium: const TextStyle(
            fontSize: 16,
            height: 1.6,
            color: AppColors.hintColor,
            fontWeight: FontWeight.w300),

        // style of details
        bodySmall: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.6)),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      floatingLabelStyle: const TextStyle(
          color: AppColors.primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w300),
      labelStyle: const TextStyle(
          color: AppColors.hintColor,
          fontSize: 14,
          fontWeight: FontWeight.w300),
      hintStyle: const TextStyle(
          color: AppColors.hintColor,
          fontSize: 14,
          fontWeight: FontWeight.w300),
      errorStyle: const TextStyle(
          fontSize: 13, fontWeight: FontWeight.w400, color: Colors.red),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.borderColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.borderColor)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}
