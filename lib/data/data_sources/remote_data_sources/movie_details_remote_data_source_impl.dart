import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../api/api_constant.dart';
import '../../../api/api_manager.dart';
import '../../../api/end_points.dart';
import '../../../api/errors/failure.dart';
import '../../../core/utils/app_constants.dart';
import '../../../domain/repositries/data_sources/remote_data_sources/movie_details_data_source.dart';
import '../../model/movie_details_response_dm.dart';
import '../../model/movie_suggestion_response_dm.dart'
    show MovieSuggestionResponseDm;

@Injectable(as: MovieDetailsDataSource)
class MovieDetailsRemoteDataSourceImpl implements MovieDetailsDataSource {
  ApiManager apiManager;

  MovieDetailsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failure, MovieDetailsResponseDm>> getMovieDetails(
      String id) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.movieDetails,
          url: ApiConstant.baseMovieUrl,
          queryParameters: {
            "movie_id": id,
            "with_cast": true,
            "with_images": true,
          },
        );

        var movieDetailsResponse =
            MovieDetailsResponseDm.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(movieDetailsResponse);
        } else {
          return left(
            ServerError(
                errorMessage:
                    movieDetailsResponse.statusMessage ?? 'Unknown error'),
          );
        }
      } else {
        return left(
            NetworkError(errorMessage: AppConstants.noInternetConnection));
      }
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieSuggestionResponseDm>> getMovieSuggestion(
      String id) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.movieSuggestions,
          url: ApiConstant.baseMovieUrl,
          queryParameters: {
            "movie_id": id,
          },
        );

        var movieSuggestionResponse =
            MovieSuggestionResponseDm.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(movieSuggestionResponse);
        } else {
          return left(
            ServerError(
                errorMessage:
                    movieSuggestionResponse.statusMessage ?? 'Unknown error'),
          );
        }
      } else {
        return left(
            NetworkError(errorMessage: AppConstants.noInternetConnection));
      }
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
