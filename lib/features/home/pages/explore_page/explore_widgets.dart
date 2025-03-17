import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';

Widget tabItem(String tabText){
  return Tab(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.orangeColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(tabText),
    ),
  );
}