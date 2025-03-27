import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/Movie%20_suggetion_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/movie_deatils_use_case.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieDetailsScreenStates.dart';
@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsScreenState>{
MovieDetailsUseCase movieDetailsUseCase;

  MovieDetailsViewModel ({required this.movieDetailsUseCase}):super (InitialState());
  void loadMovieDetailsScreen  (movieid ) async{
    var either = await movieDetailsUseCase.Invoke(movieid);
    either.fold((error){
      emit(ErrorState(error: error));
    },
            ( response) {emit(SuccessState(response: response));
        }
    );


  }





}




