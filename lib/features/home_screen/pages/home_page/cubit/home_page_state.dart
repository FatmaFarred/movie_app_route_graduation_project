import 'package:flutter/cupertino.dart';

import '../../../../../api/errors/failure.dart';
import '../../../../../data/model/movie/movie_model.dart';

@immutable
abstract class HomePageState {}

class HomePageInitialState extends HomePageState {}

class HomePageLoadingCarouselState extends HomePageState {}

class HomePageLoadingGenreState extends HomePageState {}

class HomePageSuccessState extends HomePageState {
  final List<MovieModel> carouselMovies;
  final List<MovieModel> genreActionMovies;
  final List<MovieModel> genreComedyMovies;

  HomePageSuccessState({
    this.carouselMovies = const [],
    this.genreActionMovies = const [],
    this.genreComedyMovies = const [],
  });
}

class HomePageErrorState extends HomePageState {
  final Failure error;

  HomePageErrorState({required this.error});
}