import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/utilis/App_colors.dart';



class AppTheme{
  static ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor:  AppColors.blackColor
          ,iconTheme: const IconThemeData(color: AppColors.orangeColor))
  );
}