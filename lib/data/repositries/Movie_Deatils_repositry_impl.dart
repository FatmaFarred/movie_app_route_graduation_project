import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/domain/entities/MovieDetailsResponseEntity.dart';
import 'package:movie_app_route_graduation_project/domain/entities/MovieSuggetionResponseEntity.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/data_sources/remote_data_sources/Movie%20_Details_data_source.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/reposotries/movie_details_repositry.dart';
@Injectable(as:MovieDetailsRepositry )
class MovieDetailsRepositryImpl implements MovieDetailsRepositry{
  MovieDetailsDataSource movieDetailsDataSource;
  MovieDetailsRepositryImpl ({required this.movieDetailsDataSource});

  @override
  Future<Either<Failure, MovieDetailsResponseEntity>> getMovieDeatials(int id)async {
   var either = await movieDetailsDataSource.getMovieDeatials(id);
    return either.fold((error)=>left(error), (response)=>right(response));
  }


  @override
  Future<Either<Failure, MovieSuggetionResponseEntity>> getMovieSuggetion(int id)async {
    var either = await movieDetailsDataSource.getMovieSuggetion(id);
    return either.fold((error)=>left(error), (response)=>right(response));


  }

}