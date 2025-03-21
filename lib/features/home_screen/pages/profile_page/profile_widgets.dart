import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/style manager.dart';

Widget profileInfo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Column(
        spacing:10,
        children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.whiteColor),
          child: Image.asset(
            ImageAssets.avatar8,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "Profile Name",
          style: getBoldStyle(fontSize: 20, color: AppColors.whiteColor),
        )
      ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 16,
        children: [
          Text(
            "12",
            style: getBoldStyle(fontSize: 20, color: AppColors.whiteColor),
          ),
          Text(
            "Watchlist",
            style: getBoldStyle(fontSize: 20, color: AppColors.whiteColor),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 16,
        children: [
          Text(
            "16",
            style: getBoldStyle(fontSize: 20, color: AppColors.whiteColor),
          ),
          Text(
            "History",
            style: getBoldStyle(fontSize: 20, color: AppColors.whiteColor),
          ),
        ],
      ),
    ],
  );
}

Widget buildTabItem(String title, String iconPath){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 8,
    children: [
      SvgPicture.asset(iconPath),
      Text(title, style: getBoldStyle(fontSize: 16, color: AppColors.whiteColor),)
    ],
  );
}