import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../../core/customized widgets/reusable widgets/Customized Elevated bottom.dart';
import '../../../core/customized widgets/reusable widgets/custom_text_field.dart';
import '../../../core/resources/App_colors.dart';
import '../../../core/resources/font_manager.dart';

class ForgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslations(context).forgetPassword,
        ),
      ),
      body: Column(
        children: [
          SvgPicture.asset(SvgAssets.forgotPasswordImage),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomTextField(
              keyBoardType: TextInputType.emailAddress,
              prefixIcon: SvgPicture.asset(SvgAssets.icEmail,
                  height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
              hintText: getTranslations(context).email,
            ),
          ),
          SizedBox(height: 24.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomeizedElevatedButtom(
              text: getTranslations(context).verifyEmail,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeightManager.semiBold),
            ),
          ),
        ],
      ),
    );
  }
}
