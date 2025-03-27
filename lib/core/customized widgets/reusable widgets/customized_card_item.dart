import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/routes_manager/routes.dart';
import 'package:movie_app_route_graduation_project/domain/entities/MovieDetailsResponseEntity.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieDetailsScreen.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../data/model/movie/movie_model.dart';

class CustomizedCardItem extends StatefulWidget {

  MovieModel movie;

  CustomizedCardItem({
    required this.movie,
  });

  @override
  State<CustomizedCardItem> createState() => _CustomizedCardItemState();
}

class _CustomizedCardItemState extends State<CustomizedCardItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:(){onMovieClick();} ,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Image.network(widget.movie.imageURL!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,),
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
                        '${widget.movie.rating}',
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
      ),
    );
  }

  void onMovieClick (){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Moviedetailsscreen(movieId: widget.movie.movieId??0),
      ),
    );

  }
}


class FilmCardItem extends StatelessWidget {
  final int index;

  const FilmCardItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      Navigator.of(context).pushNamed(Routes.movieDetailsRoute);
    },
      child: Card(
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