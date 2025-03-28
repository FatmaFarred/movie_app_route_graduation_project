import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/api/errors/failure.dart';
import 'package:movie_app_route_graduation_project/core/utils/app_constants.dart';
import 'package:movie_app_route_graduation_project/core/utils/prefs_manager.dart';
import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/add_to_favorite_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/add_to_history_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/get_movie_from_history_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/get_movie_is_favorite_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/movie_deatils_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/remove_from_favorite_use_case.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieDetailsScreenStates.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsScreenState> {
  MovieDetailsUseCase movieDetailsUseCase;
  AddToHistoryUseCase addToHistoryUseCase;
  AddToFavoriteUseCase addToFavoriteUseCase;
  RemoveFromFavoriteUseCase removeFromFavoriteUseCase;
  GetMovieIsFavoriteUseCase getMovieIsFavoriteUseCase;
  GetMovieFromHistoryUseCase getMovieFromHistoryUseCase;

  late String myToken;

  bool isFavorite = false;

  MovieDetailsViewModel(
      {required this.movieDetailsUseCase,
      required this.addToHistoryUseCase,
      required this.getMovieFromHistoryUseCase,
      required this.addToFavoriteUseCase,
      required this.getMovieIsFavoriteUseCase, required this.removeFromFavoriteUseCase})
      : super(InitialState());
  void loadMovieDetailsScreen(movieid) async {
    emit(LoadingState());
    myToken = await PrefsManager.getData(key: AppConstants.prefsTokenKey);
    await checkFavorite(movieid);
    var either = await movieDetailsUseCase.Invoke(movieid);
    either.fold((error) {
      emit(ErrorState(error: error));
    }, (response) {
      emit(SuccessState(response: response));
    });
  }

  void addToHistory(MovieModel movie) async {
    addToHistoryUseCase.call(movie);
  }

  Future<void> checkFavorite(String movieId) async {
    try{
      var response = await getMovieIsFavoriteUseCase(myToken, movieId);
      isFavorite = response?.data ?? false;
    }catch(e){
      if (e is Failure) {
        print(e.errorMessage);
      }else{
        print(e.toString());
      }
    }
  }

  Future<void> addToFavorite(String movieId, String name, double rating,
      String imageURL, String year) async {
    try{
      await addToFavoriteUseCase(myToken, movieId, name, rating, imageURL, year);
      isFavorite = true;
    }catch(e){
      if (e is Failure) {
        print(e.errorMessage);
      }else{
        print(e.toString());
      }
    }
  }

  Future<void> removeFromFavorite(String movieId) async {
    try{
      await removeFromFavoriteUseCase(myToken, movieId);
      isFavorite = false;
    }catch(e){
      if (e is Failure) {
        print(e.errorMessage);
      }else{
        print(e.toString());
      }
    }
  }
}
