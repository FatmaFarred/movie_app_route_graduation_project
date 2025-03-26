import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../../../../core/customized widgets/reusable widgets/Customized Elevated bottom.dart';
import '../../../../../core/resources/App_colors.dart';

import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style manager.dart';

typedef OnButtonClick = void Function();

class ProfileHeader extends StatelessWidget {
  String name, wishListCount, historyCount, avatarImage;

  OnButtonClick onEditButtonClick;

  OnButtonClick onExitButtonClick;

  ProfileHeader({
    required this.name,
    required this.wishListCount,
    required this.historyCount,
    required this.avatarImage,
    required this.onEditButtonClick,
    required this.onExitButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, right: 16.w, left: 16.w),
      child: Column(
        spacing: 22.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                spacing: 14.h,
                children: [
                  Image.asset(
                    avatarImage,
                    width: 118.w,
                    height: 118.h,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    name,
                    style: getTextStyle(20),
                  )
                ],
              ),
              Column(
                spacing: 20.h,
                children: [
                  Text(
                    wishListCount,
                    style: getTextStyle(20),
                  ),
                  Text(
                    getTranslations(context).wishList,
                    style: getTextStyle(20),
                  ),
                ],
              ),
              Column(
                spacing: 20.h,
                children: [
                  Text(
                    historyCount,
                    style: getTextStyle(20),
                  ),
                  Text(
                    getTranslations(context).history,
                    style: getTextStyle(20),
                  ),
                ],
              ),
            ],
          ),
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                flex: 2,
                child: CustomeizedElevatedButtom(
                  color: AppColors.orangeColor,
                  text: getTranslations(context).editProfile,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeightManager.semiBold),
                  onpressed: onEditButtonClick,
                ),
              ),
              Expanded(
                flex: 1,
                child: CustomeizedElevatedButtom(
                  color: AppColors.redColor,
                  bordercolor: AppColors.redColor,
                  text: getTranslations(context).exit,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeightManager.semiBold),
                  suffixIcon: const Icon(
                    Icons.logout,
                    color: AppColors.whiteColor,
                    size: 24,
                  ),
                  onpressed: onExitButtonClick,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  TextStyle getTextStyle(double fontSize) {
    return getBoldStyle(fontSize: fontSize, color: AppColors.whiteColor);
  }
}
