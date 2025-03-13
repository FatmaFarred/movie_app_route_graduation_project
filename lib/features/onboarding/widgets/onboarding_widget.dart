import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/customized%20widgets/reusable%20widgets/Customized%20Elevated%20bottom.dart';
import 'package:movie_app_route_graduation_project/core/resources/font_manager.dart';
import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../../core/resources/App_colors.dart';

typedef OnPageChanged = void Function();

class CustomPageView extends StatelessWidget {
  int currentPage, pageCount;

  String title, background;

  List<Color> gradientColors;

  String? desc;

  OnPageChanged onNextPage, onPreviousPage;

  CustomPageView(
      {super.key,
      required this.currentPage,
      required this.pageCount,
      required this.title,
      required this.background,
      required this.gradientColors,
      this.desc,
      required this.onNextPage,
      required this.onPreviousPage});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        background,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColors)),
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
                title,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              if (desc != null)
                Text(
                  desc!,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              CustomeizedElevatedButtom(
                color: AppColors.orangeColor,
                text: Text(
                  currentPage == pageCount
                      ? getTranslations(context).finish
                      : getTranslations(context).next,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeightManager.semiBold),
                ),
                onpressed: onNextPage,
              ),
              if (currentPage > 0)
                CustomeizedElevatedButtom(
                  color: AppColors.Transparent,
                  bordercolor: AppColors.orangeColor,
                  text: Text(
                    getTranslations(context).back,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.orangeColor,
                        fontWeight: FontWeightManager.semiBold),
                  ),
                  onpressed: onPreviousPage,
                )
            ],
          ),
        ),
      )
    ]);
  }
}
