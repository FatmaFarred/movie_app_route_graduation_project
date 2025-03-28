import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/resources/font_manager.dart';

import 'app_colors.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, String fontFamily) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s16,
    Color color = AppColors.whiteColor,
    String fontFamily = FontConstants.robotoFont}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, fontFamily);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s36,
    Color color = AppColors.whiteColor,
    String fontFamily = FontConstants.interFont}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color, fontFamily);
}

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s20,
    Color color = AppColors.whiteColor,
    String fontFamily = FontConstants.robotoFont}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, fontFamily);
}

TextStyle getBoldStyle(
    {double fontSize = FontSize.s24,
    Color color = AppColors.whiteColor,
    String fontFamily = FontConstants.robotoFont}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, fontFamily);
}
