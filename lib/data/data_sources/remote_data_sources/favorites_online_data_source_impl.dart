import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/favorites_online_data_source.dart';
import '../../../api/api_constant.dart';
import '../../../api/api_manager.dart';
import '../../../api/end_points.dart';
import '../../../api/errors/failure.dart';
import '../../../core/utils/app_constants.dart';
import '../../model/common_response.dart';
import '../../model/favorites/add_favorite_response.dart';
import '../../model/favorites/favorites_response.dart';
import '../../model/favorites/is_favorite_response.dart';
import '../../model/movie/movie_model.dart';

@Injectable(as: FavoritesOnlineDataSource)
class FavoritesOnlineDataSourceImpl implements FavoritesOnlineDataSource {
  final ApiManager _apiManager;

  FavoritesOnlineDataSourceImpl(this._apiManager);

  @override
  Future<MovieModel?> addMovieToFavorite(String token, String movieId,
      String name, double rating, String imageURL, String year) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.postData(
          url: ApiConstant.baseUrl,
          endPoint: EndPoints.addFavoriteApi,
          headers: {
            "Authorization": "Bearer $token"
          },
          data: {
            "movieId": movieId,
            "name": name,
            "rating": rating,
            "imageURL": imageURL,
            "year": year
          });
      var addFavoriteResponse = AddFavoriteResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return addFavoriteResponse.data;
      } else {
        throw ServerError(errorMessage: addFavoriteResponse.message);
      }
    } else {
      throw NetworkError(errorMessage: AppConstants.noInternetConnection);
    }
  }

  @override
  Future<CommonResponse?> removeMovieFromFavorite(
      String token, String movieId) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.deleteData(
          endPoint: "${EndPoints.removeFavoriteApi}$movieId",
          headers: {"Authorization": "Bearer $token"});
      var removeFavoriteResponse = CommonResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return removeFavoriteResponse;
      } else {
        throw ServerError(errorMessage: removeFavoriteResponse.message);
      }
    } else {
      throw NetworkError(errorMessage: AppConstants.noInternetConnection);
    }
  }

  @override
  Future<List<MovieModel>?> getAllFavorites(String token) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.getData(
          url: ApiConstant.baseUrl,
          endPoint: EndPoints.allFavoritesApi,
          headers: {"Authorization": "Bearer $token"});
      var favoritesResponse = FavoritesResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return favoritesResponse.data;
      } else {
        throw ServerError(errorMessage: favoritesResponse.message);
      }
    } else {
      throw NetworkError(errorMessage: AppConstants.noInternetConnection);
    }
  }

  @override
  Future<IsFavoriteResponse?> getMovieIsFavorite(
      String token, String movieId) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.getData(
          url: ApiConstant.baseUrl,
          endPoint: "${EndPoints.isFavoriteApi}$movieId",
          headers: {"Authorization": "Bearer $token"});
      var isFavoriteResponse = IsFavoriteResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return isFavoriteResponse;
      } else {
        throw ServerError(errorMessage: isFavoriteResponse.message);
      }
    } else {
      throw NetworkError(errorMessage: AppConstants.noInternetConnection);
    }
  }
}
