import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../../../api/api_constant.dart';
import '../../../api/api_manager.dart';
import '../../../api/end_points.dart';
import '../../../api/errors/failure.dart';
import '../../../core/utils/app_constants.dart';
import '../../model/movie/movie_model.dart';
import '../../model/movies/movies_response.dart';
import '../carousel_online_date_source.dart';

@Injectable(as: CarouselOnlineDataSource)
class CarouselOnlineDataSourceImpl implements CarouselOnlineDataSource {
  final ApiManager _apiManager;

  CarouselOnlineDataSourceImpl(this._apiManager);

  @override
  Future<List<MovieModel>?> getCarouselMovies() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.getData(
        url: ApiConstant.baseMovieUrl,
        endPoint: EndPoints.movieListApi,
        queryParameters: {
          'limit': 10,
          'minimum_rating': 8,
          'sort_by': 'like_count',
        },
      );

      var carouselResponse = MoviesResponse.fromJson(response.data);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return carouselResponse.data?.movies
            ?.map((movieDto) => movieDto.toMovieModel())
            .toList();
      } else {
        throw ServerError(errorMessage: carouselResponse.statusMessage);
      }
    } else {
      throw NetworkError(errorMessage: AppConstants.noInternetConnection);
    }
  }
}
