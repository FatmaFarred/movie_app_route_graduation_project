import '../../../../api/errors/failure.dart';
import '../../../../domain/entities/movie_suggestion_response_entity.dart';

abstract class MovieSuggetionState {}

class InitialSuggetionState extends MovieSuggetionState {}

class LoadingSuggetionState extends MovieSuggetionState {}

class SuccessSuggetionState extends MovieSuggetionState {

MovieSuggestionResponseEntity? response;

SuccessSuggetionState({ this.response });


}

class ErrorSuggetionState extends MovieSuggetionState {
  Failure error ;

  ErrorSuggetionState({required this.error});
}