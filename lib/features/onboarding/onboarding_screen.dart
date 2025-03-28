import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/resources/app_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/core/routes_manager/routes.dart';
import 'package:movie_app_route_graduation_project/features/onboarding/model/onboarding_model.dart';
import 'package:movie_app_route_graduation_project/features/onboarding/widgets/custom_page_view.dart';
import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../core/utils/prefs_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  late List<OnBoardingModel> onBoardingList;

  @override
  Widget build(BuildContext context) {
    onBoardingList = [
      OnBoardingModel(
          background: ImageAssets.onBoarding2,
          title: getTranslations(context).onBoardingTitlePage2,
          desc: getTranslations(context).onBoardingDescPage2,
          gradientColors: [
            AppColors.gradientonboarding2De2,
            AppColors.gradientonboarding2De3
          ]),
      OnBoardingModel(
          background: ImageAssets.onBoarding3,
          title: getTranslations(context).onBoardingTitlePage3,
          desc: getTranslations(context).onBoardingDescPage3,
          gradientColors: [
            AppColors.gradientonboarding3De1,
            AppColors.gradientonboarding3De2
          ]),
      OnBoardingModel(
          background: ImageAssets.onBoarding4,
          title: getTranslations(context).onBoardingTitlePage4,
          desc: getTranslations(context).onBoardingDescPage4,
          gradientColors: [
            AppColors.gradientonboarding4De1,
            AppColors.gradientonboarding4De2
          ]),
      OnBoardingModel(
          background: ImageAssets.onBoarding5,
          title: getTranslations(context).onBoardingTitlePage5,
          desc: getTranslations(context).onBoardingDescPage5,
          gradientColors: [
            AppColors.gradientonboarding5De1,
            AppColors.gradientonboarding5De2
          ]),
      OnBoardingModel(
          background: ImageAssets.onBoarding6,
          title: getTranslations(context).onBoardingTitlePage6,
          gradientColors: [
            AppColors.gradientonboarding6De1,
            AppColors.gradientonboarding6De2
          ]),
    ];

    return Scaffold(
        body: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: onBoardingList.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomPageView(
                currentPage: index,
                pageCount: onBoardingList.length - 1,
                onBoardingData: onBoardingList[index],
                onNextPage: onNextPage,
                onPreviousPage: onPreviousPage,
              );
            }));
  }

  void onNextPage() {
    if (_pageController.page == onBoardingList.length - 1) {
      PrefsManager.saveData(key: Routes.onBoardingRoute, value: true);
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  void onPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }
}
