import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/customized%20widgets/reusable%20widgets/Customized%20Elevated%20bottom.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../resources/font_manager.dart';

typedef OnButtonClick = void Function();

class CustomDialog {
  BuildContext context;

  String? title, message, positiveText, negativeText;

  OnButtonClick? positiveOnClick, negativeOnClick;

  bool? cancelable;

  CustomDialog.loading(
      {required this.context, this.message, this.cancelable = true}) {
    showDialog(
        context: context,
        barrierDismissible: cancelable!,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: AppColors.blackColor,
            content: Row(
              children: [
                const CircularProgressIndicator(
                  color: AppColors.orangeColor,
                ),
                ...(message != null
                    ? [
                        SizedBox(width: 16.w),
                        Text(
                          message!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ]
                    : []),
              ],
            ),
          );
        });
  }

  CustomDialog.positiveButton(
      {required this.context,
      this.title,
      this.message,
      this.positiveText,
      required this.positiveOnClick,
      this.cancelable = true}) {
    showDialog(
        context: context,
        barrierDismissible: cancelable!,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: AppColors.blackColor,
            title: Text(
              title ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            content: Text(
              message ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: [
              CustomeizedElevatedButtom(
                color: AppColors.orangeColor,
                text: positiveText ?? getTranslations(context).ok,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeightManager.semiBold),
                onpressed: positiveOnClick,
              ),
            ],
          );
        });
  }

  CustomDialog.positiveAndNegativeButton(
      {required this.context,
      this.title,
      this.message,
      this.positiveText,
      this.negativeText,
      required this.positiveOnClick,
      required this.negativeOnClick,
      this.cancelable = true}) {
    showDialog(
        context: context,
        barrierDismissible: cancelable!,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: AppColors.blackColor,
            title: Text(
              title ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            content: Text(
              message ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: CustomeizedElevatedButtom(
                      color: AppColors.Transparent,
                      bordercolor: AppColors.orangeColor,
                      text: negativeText ?? getTranslations(context).no,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.orangeColor,
                          fontWeight: FontWeightManager.semiBold),
                      onpressed: negativeOnClick,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: CustomeizedElevatedButtom(
                      color: AppColors.orangeColor,
                      text: positiveText ?? getTranslations(context).yes,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeightManager.semiBold),
                      onpressed: positiveOnClick,
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
