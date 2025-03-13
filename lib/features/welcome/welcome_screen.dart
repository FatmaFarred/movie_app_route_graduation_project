import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/core/routes_manager/routes.dart';
import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../core/customized widgets/reusable widgets/Customized Elevated bottom.dart';
import '../../core/resources/App_colors.dart';
import '../../core/resources/font_manager.dart';

class WelcomeScreen extends StatelessWidget{
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
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                Text(
                  getTranslations(context).onBoardingTitlePage1,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  getTranslations(context).onBoardingDescPage1,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.lightWhiteColor
                  ),
                  textAlign: TextAlign.center,
                ),
                CustomeizedElevatedButtom(
                  color: AppColors.orangeColor,
                  text: Text(
                    getTranslations(context).exploreNow,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.blackColor,
                        fontWeight: FontWeightManager.semiBold),
                  ),
                  onpressed: (){
                    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
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