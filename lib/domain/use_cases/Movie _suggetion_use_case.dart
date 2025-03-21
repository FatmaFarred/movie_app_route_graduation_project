import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/entities/MovieSuggetionResponseEntity.dart';

import '../../Api manager/errors/failure.dart';
import '../entities/MovieDetailsResponseEntity.dart';
import '../repositries/reposotries/movie_details_repositry.dart';
@injectable
class MovieSuggetionUseCaseUseCase {
  MovieDetailsRepositry  movieDetailsRepositry ;
  MovieSuggetionUseCaseUseCase ({required this.movieDetailsRepositry});
  Future <Either<Failure,MovieSuggetionResponseEntity>> Invoke (int id ){
    return movieDetailsRepositry.getMovieSuggetion(id);
  }



}