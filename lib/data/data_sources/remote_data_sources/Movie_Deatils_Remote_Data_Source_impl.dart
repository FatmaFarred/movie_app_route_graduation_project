import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import '../../../Api manager/Api_constant.dart';
import '../../../Api manager/Api_manager.dart';
import '../../../Api manager/end_points.dart';
import '../../../Api manager/errors/failure.dart';
import '../../../domain/entities/MovieDetailsResponseEntity.dart';
import '../../../domain/entities/MovieSuggetionResponseEntity.dart';
import '../../../domain/repositries/data_sources/remote_data_sources/Movie _Details_data_source.dart';
import '../../model/MovieDetailsResponseDm.dart';
import '../../model/MovieSuggetionResponseDm.dart' show MovieSuggetionResponseDm;

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsDataSource {
   ApiManager apiManager;

  MovieDetailsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failure, MovieDetailsResponseDm>> getMovieDetails(int id) async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.MovieDetails,
          url: ApiConstant.baseMovieUrl,
          queryParameters: {
            "movie_id": id,
            "with_cast": true,
            "with_images": true,
          },
        );
        var movieDetailsResponse = MovieDetailsResponseDm.fromJson(response.data);


        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(movieDetailsResponse);
        } else {
          return left(
            serverError(errorMessage: movieDetailsResponse.statusMessage ?? 'Unknown error'),
          );
        }
      } else {
        return left(NetworkError(errorMessage: "No internet connection"));
      }
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieSuggetionResponseDm>> getMovieSuggestion(int id) async {
    // TODO: Implement getMovieSuggestion
    throw UnimplementedError();
  }
}
