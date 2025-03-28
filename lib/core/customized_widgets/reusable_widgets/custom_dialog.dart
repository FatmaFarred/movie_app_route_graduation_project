import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_app_route_graduation_project/core/resources/app_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/style_manager.dart';
import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../resources/font_manager.dart';
import 'customized_elevated_button.dart';

class CustomDialog {
  BuildContext context;

  String? title, message, positiveText, negativeText;

  Function? positiveOnClick, negativeOnClick;

  CustomDialog.loading(
      {required this.context, this.message, bool cancelable = true}) {
    showDialog(
        context: context,
        barrierDismissible: cancelable,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: AppColors.blackColor,
            content: Row(
              children: [
                const CircularProgressIndicator(
                  color: AppColors.orangeColor,
                ),
                if (message != null) ...[
                  SizedBox(width: 16.w),
                  Text(
                    message!,
                    style:
                        getSemiBoldStyle(fontFamily: FontConstants.interFont),
                  ),
                ],
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
      this.positiveOnClick,
      bool cancelable = true}) {
    showDialog(
        context: context,
        barrierDismissible: cancelable,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: AppColors.blackColor,
            title: Text(
              title ?? "",
              style: getBoldStyle(fontFamily: FontConstants.interFont),
            ),
            content: Text(
              message ?? "",
              style: getSemiBoldStyle(fontFamily: FontConstants.interFont),
            ),
            actions: [
              CustomizedElevatedButton(
                color: AppColors.orangeColor,
                text: positiveText ?? getTranslations(context).ok,
                onPressed: () {
                  if (positiveOnClick != null) {
                    positiveOnClick!();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
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
      this.positiveOnClick,
      this.negativeOnClick,
      bool cancelable = true}) {
    showDialog(
        context: context,
        barrierDismissible: cancelable,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: AppColors.blackColor,
            title: Text(
              title ?? "",
              style: getBoldStyle(fontFamily: FontConstants.interFont),
            ),
            content: Text(
              message ?? "",
              style: getSemiBoldStyle(fontFamily: FontConstants.interFont),
            ),
            actions: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: CustomizedElevatedButton(
                      color: Colors.transparent,
                      text: negativeText ?? getTranslations(context).no,
                      textStyle: getSemiBoldStyle(
                          fontFamily: FontConstants.interFont,
                          color: AppColors.orangeColor),
                      onPressed: () {
                        if (negativeOnClick != null) {
                          negativeOnClick!();
                        } else {
                          Navigator.of(ctx).pop();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: CustomizedElevatedButton(
                      text: positiveText ?? getTranslations(context).yes,
                      onPressed: () {
                        if (positiveOnClick != null) {
                          positiveOnClick!();
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
