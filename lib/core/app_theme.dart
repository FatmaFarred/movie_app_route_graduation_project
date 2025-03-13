import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/resources/app_colors.dart';

class AppTheme{
  static ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor:  AppColors.blackColor
          ,iconTheme: IconThemeData(color: AppColors.orangeColor))
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBlackColor,
    dividerColor: AppColors.orangeColor,
    dividerTheme: const DividerThemeData(
      color: AppColors.orangeColor,
    ),
    primaryColor: AppColors.orangeColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: AppColors.whiteColor, fontSize: 16, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          color: AppColors.whiteColor, fontSize: 14, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          color: AppColors.whiteColor, fontSize: 12, fontWeight: FontWeight.w500),
      labelLarge: TextStyle(
          color: AppColors.whiteColor, fontSize: 22, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(
          color: AppColors.whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(
          color: AppColors.whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.orangeColor,
        foregroundColor: AppColors.whiteColor,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBlackColor,
      foregroundColor: AppColors.orangeColor,
      centerTitle: true,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: AppColors.orangeColor,
            textStyle: const TextStyle(
                color: AppColors.orangeColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 20))),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColors.whiteColor,
      suffixIconColor: AppColors.whiteColor,
      hintStyle: const TextStyle(
          fontSize: 16, color: AppColors.whiteColor, fontWeight: FontWeight.w500),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.orangeColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.orangeColor, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.orangeColor, width: 1),
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
  );
}