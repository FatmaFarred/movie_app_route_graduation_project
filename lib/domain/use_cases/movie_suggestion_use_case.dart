import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/entities/movie_suggestion_response_entity.dart';

import '../../../../api/errors/failure.dart';
import '../repositries/reposotries/movie_details_repositry.dart';
@injectable
class MovieSuggestionUseCase {
  MovieDetailsRepository  movieDetailsRepositry ;
  MovieSuggestionUseCase ({required this.movieDetailsRepositry});
  Future <Either<Failure,MovieSuggestionResponseEntity>> Invoke (String id ){
    return movieDetailsRepositry.getMovieSuggestion(id);
  }



}