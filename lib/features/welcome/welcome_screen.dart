import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/core/resources/style_manager.dart';
import 'package:movie_app_route_graduation_project/core/routes_manager/routes.dart';
import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../core/customized_widgets/reusable_widgets/customized_elevated_button.dart';
import '../../core/resources/app_colors.dart';
import '../../core/resources/font_manager.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          ImageAssets.onBoarding1,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                AppColors.gradientonboarding1De1,
                AppColors.gradientonboarding1De2,
                AppColors.gradientonboarding1De3,
                AppColors.gradientonboarding1De4
              ])),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16.h,
              children: [
                Text(
                  getTranslations(context).onBoardingTitlePage1,
                  style: getMediumStyle(),
                  textAlign: TextAlign.center,
                ),
                Text(
                  getTranslations(context).onBoardingDescPage1,
                  style: getRegularStyle(
                      fontSize: FontSize.s20,
                      fontFamily: FontConstants.interFont,
                      color: AppColors.lightWhiteColor),
                  textAlign: TextAlign.center,
                ),
                CustomizedElevatedButton(
                  text: getTranslations(context).exploreNow,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.onBoardingRoute);
                  },
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
