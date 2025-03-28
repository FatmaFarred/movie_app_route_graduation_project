import 'package:dartz/dartz.dart';
import 'package:movie_app_route_graduation_project/domain/entities/movie_details_response_entity.dart';
import 'package:movie_app_route_graduation_project/domain/entities/movie_suggestion_response_entity.dart';

import '../../../../api/errors/failure.dart';

abstract class MovieDetailsRepository {

Future <Either<Failure,MovieDetailsResponseEntity>> getMovieDetails(String id );

Future <Either<Failure,MovieSuggestionResponseEntity>> getMovieSuggestion(String id );

}


