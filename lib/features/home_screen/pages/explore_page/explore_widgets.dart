import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/font_manager.dart';

Widget tabItem(String genre) {
  return Tab(
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.orangeColor, width: 2.r),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        genre,
        style: TextStyle(
          fontFamily: FontConstants.interFont,
          fontWeight: FontWeightManager.bold,
          fontSize: FontSize.s20.sp,
        ),
      ),
    ),
  );
}