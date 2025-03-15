import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/assets_manager.dart';

Widget cardItem(index){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
          children: [
            Image.asset(
              getFilmImage(index),
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${getFilmRating(index)}',
                      // Display film rating
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.star,
                      color: AppColors.orangeColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
      ),
    ),
  );
}

String getFilmImage(int index) {
  return index % 2 == 0 ? ImageAssets.filmImage : ImageAssets.onBoarding1;
}

double getFilmRating(int index) {
  return (index % 5) + 1.0;
}