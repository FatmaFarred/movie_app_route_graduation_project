import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/search_online_data_source.dart';
import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';

import '../../../Api manager/Api_constant.dart';
import '../../../Api manager/Api_manager.dart';
import '../../../Api manager/end_points.dart';
import '../../../Api manager/errors/failure.dart';
import '../../model/movies/movies_response.dart';

@Injectable(as: SearchOnlineDataSource)
class SearchOnlineDataSourceImpl implements SearchOnlineDataSource {
  ApiManager _apiManager;

  SearchOnlineDataSourceImpl(this._apiManager);

  @override
  Future<List<MovieModel>?> searchMovie(String search) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.getData(
          url: ApiConstant.baseMovieUrl,
          endPoint: EndPoints.movieListApi,
          queryParameters: {"query_term": search});
      var searchResponse = MoviesResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return searchResponse.data?.movies
            ?.map((searchDto) => searchDto.toMovieModel())
            .toList();
      } else {
        throw serverError(errorMessage: searchResponse.statusMessage);
      }
    } else {
      throw NetworkError(errorMessage: "No Internet Connection");
    }
  }
}
