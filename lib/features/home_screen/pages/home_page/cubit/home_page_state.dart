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
  final List<List<MovieModel>> genresLists;

  HomePageSuccessState({
    this.carouselMovies = const [],
    this.genresLists = const [],
  });

  HomePageSuccessState copyWith({
    List<MovieModel>? carouselMovies,
    List<List<MovieModel>>? genresLists,
  }) {
    return HomePageSuccessState(
      carouselMovies: carouselMovies ?? this.carouselMovies,
      genresLists: genresLists ?? this.genresLists,
    );
  }
}

class HomePageErrorState extends HomePageState {
  final Failure error;

  HomePageErrorState({required this.error});
}