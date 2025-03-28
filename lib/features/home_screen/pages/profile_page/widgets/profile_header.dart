import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../../../../core/customized_widgets/reusable_widgets/customized_elevated_button.dart';
import '../../../../../core/resources/app_colors.dart';

import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

typedef OnButtonClick = void Function();

class ProfileHeader extends StatelessWidget {
  String name, wishListCount, historyCount, avatarImage;

  OnButtonClick onEditButtonClick;

  OnButtonClick onExitButtonClick;

  ProfileHeader({super.key,
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
                child: CustomizedElevatedButton(
                  color: AppColors.orangeColor,
                  text: getTranslations(context).editProfile,
                  textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeightManager.semiBold),
                  onPressed: onEditButtonClick,
                ),
              ),
              Expanded(
                flex: 1,
                child: CustomizedElevatedButton(
                  color: AppColors.redColor,
                  borderColor: AppColors.redColor,
                  text: getTranslations(context).exit,
                  textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeightManager.semiBold),
                  suffixIcon: const Icon(
                    Icons.logout,
                    color: AppColors.whiteColor,
                    size: 24,
                  ),
                  onPressed: onExitButtonClick,
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
