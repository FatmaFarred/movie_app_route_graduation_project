import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/Movie%20_suggetion_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/movie_deatils_use_case.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieDetailsScreenStates.dart';
@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsScreenState>{
MovieDetailsUseCase movieDetailsUseCase;
MovieSuggetionUseCaseUseCase movieSuggetionUseCase ;


  MovieDetailsViewModel ({required this.movieDetailsUseCase, required this.movieSuggetionUseCase}):super (InitialState());
  void loadMovieDetailsScreen  () async{
    emit(LoadingState());
    _loadMovieDetails ();
    _loadMovieSuggetion ();

  }

  void _loadMovieDetails ()async{
    var either = await movieDetailsUseCase.Invoke(15);
    either.fold((error){
      emit(ErrorState(error: error));
      },
       ( response) {emit(SuccessState(response: response));
    }
    );


  }

void _loadMovieSuggetion ()async{
  var either = await movieSuggetionUseCase.Invoke(15);
  either.fold((error){
    emit(ErrorState(error: error));
  },
          ( response) {
    emit(SuccessState(suggetionResponse:response.data?.movies  ));
      }
  );


}





}




