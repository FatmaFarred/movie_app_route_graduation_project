import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/font_manager.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.blackColor,
          iconTheme: IconThemeData(color: AppColors.orangeColor),
          titleTextStyle: TextStyle(
              fontFamily: FontConstants.robotoFont,
              fontWeight: FontWeightManager.regular,
              fontSize: FontSize.s16,
              color: AppColors.orangeColor)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontFamily: FontConstants.interFont,
            fontWeight: FontWeightManager.medium,
            fontSize: FontSize.s36,
            color: AppColors.whiteColor),
        bodyMedium: TextStyle(
            fontFamily: FontConstants.interFont,
            fontWeight: FontWeightManager.bold,
            fontSize: FontSize.s24,
            color: AppColors.whiteColor),
        bodySmall: TextStyle(
            fontFamily: FontConstants.interFont,
            fontWeight: FontWeightManager.regular,
            fontSize: FontSize.s20,
            color: AppColors.whiteColor),
      ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColors.whiteColor,
      suffixIconColor: AppColors.whiteColor,
      fillColor: AppColors.darkGrayColor,
      filled: true,
      contentPadding: const EdgeInsets.all(16),
      hintStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.darkGrayColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.darkGrayColor, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.darkGrayColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.redColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.redColor, width: 1),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.orangeColor,
        foregroundColor: AppColors.blackColor,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );
}
