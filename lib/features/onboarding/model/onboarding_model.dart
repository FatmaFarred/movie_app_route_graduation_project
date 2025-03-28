import 'dart:ui';

class OnBoardingModel {
  String background, title;

  String? desc;

  List<Color> gradientColors;

  OnBoardingModel(
      {required this.background, required this.title, this.desc, required this.gradientColors});
}
