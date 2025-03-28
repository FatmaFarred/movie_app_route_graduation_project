import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../api/errors/failure.dart';
import '../entities/movie_details_response_entity.dart';
import '../repositries/reposotries/movie_details_repositry.dart';
@injectable
class MovieDetailsUseCase {
  MovieDetailsRepository  movieDetailsRepositry ;
  MovieDetailsUseCase ({required this.movieDetailsRepositry});
  Future <Either<Failure,MovieDetailsResponseEntity>> Invoke (String id ){
     return movieDetailsRepositry.getMovieDetails(id);
  }



}