import 'package:dartz/dartz.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/domain/entities/MovieDetailsResponseEntity.dart';
import 'package:movie_app_route_graduation_project/domain/entities/MovieSuggetionResponseEntity.dart';

abstract class MovieDetailsRepositry {

Future <Either<Failure,MovieDetailsResponseEntity>> getMovieDeatials(String id );

Future <Either<Failure,MovieSuggetionResponseEntity>> getMovieSuggetion(String id );

}


