import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';

import '../../../core/resources/style_manager.dart';
import 'Textwidget.dart';

class IconWithTextContainerWidget extends StatelessWidget {
  String? imagePath;
  String title;
  double? height;

  IconWithTextContainerWidget(
      {super.key, this.imagePath, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122.w,
      height: height ?? 47.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.darkGrayColor,
      ),
      child: Row(
        mainAxisAlignment: imagePath == null
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceEvenly,
        children: [
          imagePath == null
              ? const SizedBox()
              : SvgPicture.asset(
                  imagePath ?? "",
                  height: 28.h,
                  width: 28.w,
                ),
          TextWidget(
            text: title,
            style: imagePath == null
                ? getRegularStyle(color: AppColors.whiteColor, fontSize: 16)
                : getBoldStyle(color: AppColors.whiteColor, fontSize: 24),
          )
        ],
      ),
    );
  }
}
