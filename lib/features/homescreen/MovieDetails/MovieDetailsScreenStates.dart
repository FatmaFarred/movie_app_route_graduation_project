import '../../../api/errors/failure.dart';
import '../../../data/model/movie/movie_model.dart';
import '../../../domain/entities/movie_details_response_entity.dart';

abstract class MovieDetailsScreenState {}

class InitialState extends MovieDetailsScreenState {}

class LoadingState extends MovieDetailsScreenState {}

class SuccessState extends MovieDetailsScreenState {

MovieDetailsResponseEntity? response;

SuccessState({ this.response});


}

class ErrorState extends MovieDetailsScreenState {
  Failure error ;

  ErrorState({required this.error});
}