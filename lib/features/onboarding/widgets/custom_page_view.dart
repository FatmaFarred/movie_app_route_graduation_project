import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/resources/font_manager.dart';
import 'package:movie_app_route_graduation_project/core/resources/style_manager.dart';
import 'package:movie_app_route_graduation_project/features/onboarding/model/onboarding_model.dart';
import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../../core/customized_widgets/reusable_widgets/customized_elevated_button.dart';
import '../../../core/resources/app_colors.dart';

typedef OnPageChanged = void Function();

class CustomPageView extends StatelessWidget {
  int currentPage, pageCount;

  OnBoardingModel onBoardingData;

  OnPageChanged onNextPage, onPreviousPage;

  CustomPageView(
      {super.key,
      required this.currentPage,
      required this.pageCount,
      required this.onBoardingData,
      required this.onNextPage,
      required this.onPreviousPage});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        onBoardingData.background,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: onBoardingData.gradientColors)),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.blackColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16.h,
            children: [
              Text(
                onBoardingData.title,
                style: getBoldStyle(),
                textAlign: TextAlign.center,
              ),
              if (onBoardingData.desc != null)
                Text(
                  onBoardingData.desc!,
                  style: getRegularStyle(fontSize: FontSize.s20),
                  textAlign: TextAlign.center,
                ),
              CustomizedElevatedButton(
                text: currentPage == pageCount
                    ? getTranslations(context).finish
                    : getTranslations(context).next,
                onPressed: () {
                  onNextPage();
                },
              ),
              if (currentPage > 0)
                CustomizedElevatedButton(
                  color: Colors.transparent,
                  borderColor: AppColors.orangeColor,
                  text: getTranslations(context).back,
                  textStyle: getSemiBoldStyle(
                      fontFamily: FontConstants.interFont,
                      color: AppColors.orangeColor),
                  onPressed: onPreviousPage,
                )
            ],
          ),
        ),
      )
    ]);
  }
}
