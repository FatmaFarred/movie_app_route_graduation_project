import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/resources/app_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/font_manager.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.blackColor,
          iconTheme: const IconThemeData(color: AppColors.orangeColor),
          titleTextStyle: TextStyle(
              fontFamily: FontConstants.robotoFont,
              fontWeight: FontWeightManager.regular,
              fontSize: FontSize.s16.sp,
              color: AppColors.orangeColor)),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontFamily: FontConstants.interFont,
            fontWeight: FontWeightManager.medium,
            fontSize: FontSize.s36.sp,
            color: AppColors.whiteColor),
        bodyMedium: TextStyle(
            fontFamily: FontConstants.interFont,
            fontWeight: FontWeightManager.bold,
            fontSize: FontSize.s24.sp,
            color: AppColors.whiteColor),
        bodySmall: TextStyle(
            fontFamily: FontConstants.interFont,
            fontWeight: FontWeightManager.regular,
            fontSize: FontSize.s20.sp,
            color: AppColors.whiteColor),
      ));
}
