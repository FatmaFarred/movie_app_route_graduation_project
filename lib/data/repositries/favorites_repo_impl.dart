import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/favorites_online_data_source.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/favorites_repo.dart';

import '../model/common_response.dart';
import '../model/favorites/is_favorite_response.dart';
import '../model/movie/movie_model.dart';

@Injectable(as: FavoritesRepo)
class FavoritesRepoImpl implements FavoritesRepo {
  final FavoritesOnlineDataSource _favoritesOnlineDataSource;

  FavoritesRepoImpl(this._favoritesOnlineDataSource);

  @override
  Future<MovieModel?> addMovieToFavorite(String token, String movieId,
      String name, double rating, String imageURL, String year) {
    return _favoritesOnlineDataSource.addMovieToFavorite(
        token, movieId, name, rating, imageURL, year);
  }

  @override
  Future<CommonResponse?> removeMovieFromFavorite(
      String token, String movieId) {
    return _favoritesOnlineDataSource.removeMovieFromFavorite(token, movieId);
  }

  @override
  Future<List<MovieModel>?> getAllFavorites(String token) {
    return _favoritesOnlineDataSource.getAllFavorites(token);
  }

  @override
  Future<IsFavoriteResponse?> getMovieIsFavorite(String token, String movieId) {
    return _favoritesOnlineDataSource.getMovieIsFavorite(token, movieId);
  }
}
