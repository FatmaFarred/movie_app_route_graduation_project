import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_cases/movie_suggestion_use_case.dart';
import 'Moviesuggetion States.dart';
@injectable
class MovieSuggetionViewModel extends Cubit<MovieSuggetionState>{
MovieSuggestionUseCase movieSuggetionUseCase ;


MovieSuggetionViewModel ({ required this.movieSuggetionUseCase}):super (InitialSuggetionState());




void loadMovieSuggetion (movieid)async{
  var either = await movieSuggetionUseCase.Invoke(movieid);
  either.fold((error){
    emit(ErrorSuggetionState(error: error));
  },
          ( response) {
    emit(SuccessSuggetionState(response: response  ));
      }
  );


}





}




