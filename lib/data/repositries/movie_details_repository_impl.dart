import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/entities/movie_details_response_entity.dart';
import 'package:movie_app_route_graduation_project/domain/entities/movie_suggestion_response_entity.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/reposotries/movie_details_repositry.dart';

import '../../api/errors/failure.dart';
import '../../domain/repositries/data_sources/remote_data_sources/movie_details_data_source.dart';

@Injectable(as:MovieDetailsRepository )
class MovieDetailsRepositoryImpl implements MovieDetailsRepository{
  MovieDetailsDataSource movieDetailsDataSource;
  MovieDetailsRepositoryImpl ({required this.movieDetailsDataSource});

  @override
  Future<Either<Failure, MovieDetailsResponseEntity>> getMovieDetails(String id)async {
   var either = await movieDetailsDataSource.getMovieDetails(id);
    return either.fold((error)=>left(error), (response)=>right(response));
  }


  @override
  Future<Either<Failure, MovieSuggestionResponseEntity>> getMovieSuggestion(String id)async {
    var either = await movieDetailsDataSource.getMovieSuggestion(id);
    return either.fold((error)=>left(error), (response)=>right(response));


  }

}