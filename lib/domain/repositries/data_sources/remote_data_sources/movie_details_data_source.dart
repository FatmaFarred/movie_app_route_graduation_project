import 'package:dartz/dartz.dart';

import '../../../../api/errors/failure.dart';
import '../../../entities/movie_details_response_entity.dart';
import '../../../entities/movie_suggestion_response_entity.dart';

abstract class MovieDetailsDataSource {
  Future<Either<Failure, MovieDetailsResponseEntity>> getMovieDetails(
      String id);

  Future<Either<Failure, MovieSuggestionResponseEntity>> getMovieSuggestion(
      String id);
}
