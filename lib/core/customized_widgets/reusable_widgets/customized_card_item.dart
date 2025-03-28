import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/customized_widgets/reusable_widgets/custom_loading.dart';
import 'package:movie_app_route_graduation_project/core/resources/style_manager.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../data/model/movie/movie_model.dart';
import '../../../features/home_screen/MovieDetails/MovieDetailsScreen.dart';

class CustomizedCardItem extends StatelessWidget {
  MovieModel movie;

  CustomizedCardItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onMovieClick(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Stack(
            children: [
              Image.network(
                movie.imageURL!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                loadingBuilder: (context, child, loading) =>
                    loading == null ? child : const CustomLoading(),
                errorBuilder: (context, error, stackTrace) =>
                    Center(child: Icon(Icons.error, size: 50.sp)),
              ),
              Positioned(
                top: 10.h,
                left: 10.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: .7),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${movie.rating}',
                        style: getRegularStyle(),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.star,
                        color: AppColors.orangeColor,
                        size: 18.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onMovieClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Moviedetailsscreen(movieId: movie.movieId ?? ""),
      ),
    );
  }
}

class FilmCardItem extends StatelessWidget {
  final int index;

  const FilmCardItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
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
              width: double.infinity,
              height: double.infinity,
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
                  color: Colors.black.withValues(alpha: 0.7),
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
}

String getFilmImage(int index) {
  return index % 2 == 0 ? ImageAssets.onBoarding6 : ImageAssets.onBoarding2;
}

double getFilmRating(int index) {
  return (index % 5) + 1.0;
}
