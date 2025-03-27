import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/Movie%20_suggetion_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/add_to_history_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/get_movie_from_history_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/movie_deatils_use_case.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieDetailsScreenStates.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/shared_ preferences.dart';
@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsScreenState>{
MovieDetailsUseCase movieDetailsUseCase;
AddToHistoryUseCase addToHistoryUseCase;
GetMovieFromHistoryUseCase getMovieFromHistoryUseCase;

  MovieDetailsViewModel ({required this.movieDetailsUseCase, required this.addToHistoryUseCase, required this.getMovieFromHistoryUseCase}):super (InitialState());
  void loadMovieDetailsScreen  (movieid ) async{
    var either = await movieDetailsUseCase.Invoke(movieid);
    either.fold((error){
      emit(ErrorState(error: error));
    },
            ( response) {emit(SuccessState(response: response));
        }
    );


  }

void addToHistory(MovieModel movie) async {
  addToHistoryUseCase.call(movie);
}






}









