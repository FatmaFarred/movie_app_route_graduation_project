import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/genre_online_data_source.dart';

import '../../../Api manager/Api_constant.dart';
import '../../../Api manager/Api_manager.dart';
import '../../../Api manager/end_points.dart';
import '../../../Api manager/errors/failure.dart';
import '../../model/movies/movies_response.dart';

@Injectable(as: GenreOnlineDataSource)
class GenreOnlineDataSourceImpl implements GenreOnlineDataSource {
  ApiManager _apiManager;

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
          queryParameters: {"genre": genre, "page": page});
      var genreResponse = MoviesResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return genreResponse;
      } else {
        throw serverError(errorMessage: genreResponse.statusMessage);
      }
    } else {
      throw NetworkError(errorMessage: "No Internet Connection");
    }
  }
}
