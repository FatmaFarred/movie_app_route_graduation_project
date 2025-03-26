import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/domain/entities/MovieDetailsResponseEntity.dart';
import 'package:movie_app_route_graduation_project/domain/entities/MovieSuggetionResponseEntity.dart';

abstract class MovieSuggetionState {}

class InitialSuggetionState extends MovieSuggetionState {}

class LoadingSuggetionState extends MovieSuggetionState {}

class SuccessSuggetionState extends MovieSuggetionState {

MovieSuggetionResponseEntity? response;

SuccessSuggetionState({ this.response });


}

class ErrorSuggetionState extends MovieSuggetionState {
  Failure error ;

  ErrorSuggetionState({required this.error});
}