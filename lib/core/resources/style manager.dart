import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color, String fontFamily ) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s16, required Color color,String fontFamily=FontConstants.robotoFont }) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color,fontFamily);
}

TextStyle getBoldStyle(
    {double fontSize = FontSize.s16, required Color color,String fontFamily=FontConstants.robotoFont }) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color,fontFamily);
}

TextStyle getMidiumStyle(
    {double fontSize = FontSize.s16, required Color color,String fontFamily=FontConstants.robotoFont }) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color,fontFamily);
}



