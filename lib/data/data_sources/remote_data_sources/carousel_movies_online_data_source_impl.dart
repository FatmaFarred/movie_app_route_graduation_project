import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../../../Api manager/Api_constant.dart';
import '../../../Api manager/Api_manager.dart';
import '../../../Api manager/end_points.dart';
import '../../../Api manager/errors/failure.dart';
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
        throw serverError(errorMessage: carouselResponse.statusMessage);
      }
    } else {
      throw NetworkError(errorMessage: "No Internet Connection");
    }
  }
}