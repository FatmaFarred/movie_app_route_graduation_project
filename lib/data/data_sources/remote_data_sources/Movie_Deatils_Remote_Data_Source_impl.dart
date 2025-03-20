import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/Api_constant.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/Api_manager.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/end_points.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/data/model/MovieDetailsResponseDm.dart';
import 'package:movie_app_route_graduation_project/domain/entities/MovieDetailsResponseEntity.dart';
import 'package:movie_app_route_graduation_project/domain/entities/MovieSuggetionResponseEntity.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/data_sources/remote_data_sources/Movie%20_Details_data_source.dart';
@Injectable(as: MovieDetailsDataSource)
class MovieDetailsRemoteDataSourceImpl implements MovieDetailsDataSource{
  @override
  ApiManager apiManager ;
  MovieDetailsRemoteDataSourceImpl ({required this.apiManager})
  Future<Either<Failure, MovieDetailsResponseEntity>> getMovieDeatials(int id)async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.MovieDetails,
          url: ApiConstant.baseMovieUrl,
          queryParameters: {"movie_id": id,
            "with_cast": true,
            "with_images": true
          },
        );
        var MoviedetailsResponse = MovieDetailsResponseDm.fromJson(
            response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(MoviedetailsResponse);
        } else {
          return left(
              serverError(errorMessage: MoviedetailsResponse.statusMessage));
        }
      } else {
        return left(NetworkError(errorMessage: "No Ienternet Connection"));
      }
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }


  @override
  Future<Either<Failure, MovieSuggetionResponseEntity>> getMovieSuggetion(int id) {
    // TODO: implement getMovieSuggetion
    throw UnimplementedError();
  }



}