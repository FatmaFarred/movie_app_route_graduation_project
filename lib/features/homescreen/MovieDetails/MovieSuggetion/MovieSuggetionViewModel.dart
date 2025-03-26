import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/Movie%20_suggetion_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/movie_deatils_use_case.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieDetailsScreenStates.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieSuggetion/Moviesuggetion%20States.dart';
@injectable
class MovieSuggetionViewModel extends Cubit<MovieSuggetionState>{
MovieSuggetionUseCaseUseCase movieSuggetionUseCase ;


MovieSuggetionViewModel ({ required this.movieSuggetionUseCase}):super (InitialSuggetionState());




void loadMovieSuggetion ()async{
  var either = await movieSuggetionUseCase.Invoke(15);
  either.fold((error){
    emit(ErrorSuggetionState(error: error));
  },
          ( response) {
    emit(SuccessSuggetionState(response: response  ));
      }
  );


}





}




