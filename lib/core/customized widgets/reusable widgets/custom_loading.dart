import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';

class CustomLoading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.orangeColor,
      ),
    );
  }

}