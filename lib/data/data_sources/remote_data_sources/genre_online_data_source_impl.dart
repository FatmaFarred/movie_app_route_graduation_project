import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/genre_online_data_source.dart';

import '../../../api/api_constant.dart';
import '../../../api/api_manager.dart';
import '../../../api/end_points.dart';
import '../../../api/errors/failure.dart';
import '../../../core/utils/app_constants.dart';
import '../../model/movies/movies_response.dart';

@Injectable(as: GenreOnlineDataSource)
class GenreOnlineDataSourceImpl implements GenreOnlineDataSource {
  final ApiManager _apiManager;

  GenreOnlineDataSourceImpl(this._apiManager);

  @override
  Future<MoviesResponse?> getGenre(String genre, int page) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.getData(
          url: ApiConstant.baseMovieUrl,
          endPoint: EndPoints.movieListApi,
          queryParameters: {"genre": genre, "page": page, "sort_by": "year"});
      var genreResponse = MoviesResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return genreResponse;
      } else {
        throw ServerError(errorMessage: genreResponse.statusMessage);
      }
    } else {
      throw NetworkError(errorMessage: AppConstants.noInternetConnection);
    }
  }
}
