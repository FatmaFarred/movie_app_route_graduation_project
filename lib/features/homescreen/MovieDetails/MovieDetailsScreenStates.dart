import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/domain/entities/MovieDetailsResponseEntity.dart';
import 'package:movie_app_route_graduation_project/domain/entities/MovieSuggetionResponseEntity.dart';

abstract class MovieDetailsScreenState {}

class InitialState extends MovieDetailsScreenState {}

class LoadingState extends MovieDetailsScreenState {}

class SuccessState extends MovieDetailsScreenState {

MovieDetailsResponseEntity? response;
List<MoviesSugEntity> ?suggetionResponse ;

SuccessState({ this.response ,  this.suggetionResponse});


}

class ErrorState extends MovieDetailsScreenState {
  Failure error ;

  ErrorState({required this.error});
}