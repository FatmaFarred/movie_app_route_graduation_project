import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/resources/app_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/style_manager.dart';

import '../../resources/font_manager.dart';

class CustomizedElevatedButton extends StatelessWidget {
  Color? borderColor;
  Color? color;
  String text;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextStyle? textStyle;
  Function? onPressed;
  CustomizedElevatedButton(
      {super.key,
      this.borderColor,
      this.color,
      required this.text,
      this.textStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.all(16.w),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor ?? AppColors.orangeColor),
                borderRadius: BorderRadius.circular(15.r)),
            backgroundColor: color ?? AppColors.orangeColor),
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[
              prefixIcon!,
              SizedBox(
                width: 10.w,
              )
            ],
            Text(
              text,
              style: textStyle ??
                  getSemiBoldStyle(
                      fontFamily: FontConstants.interFont,
                      color: AppColors.blackColor),
            ),
            if (suffixIcon != null) ...[
              SizedBox(
                width: 10.w,
              ),
              suffixIcon!
            ]
          ],
        ));
  }
}
