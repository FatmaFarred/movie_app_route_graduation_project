import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../Api manager/errors/failure.dart';
import '../entities/MovieDetailsResponseEntity.dart';
import '../repositries/reposotries/movie_details_repositry.dart';
@injectable
class MovieDetailsUseCase {
  MovieDetailsRepositry  movieDetailsRepositry ;
  MovieDetailsUseCase ({required this.movieDetailsRepositry});
  Future <Either<Failure,MovieDetailsResponseEntity>> Invoke (String id ){
     return movieDetailsRepositry.getMovieDeatials(id);
  }



}