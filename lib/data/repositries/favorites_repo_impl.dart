import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/favorites_online_data_source.dart';
import 'package:movie_app_route_graduation_project/domain/entities/add_favorite.dart';
import 'package:movie_app_route_graduation_project/domain/entities/favorites.dart';
import 'package:movie_app_route_graduation_project/domain/entities/is_favorite.dart';
import 'package:movie_app_route_graduation_project/domain/entities/remove_favorite.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/favorites_repo.dart';

@Injectable(as: FavoritesRepo)
class FavoritesRepoImpl implements FavoritesRepo {
  FavoritesOnlineDataSource _favoritesOnlineDataSource;

  FavoritesRepoImpl(this._favoritesOnlineDataSource);

  @override
  Future<AddFavorite?> addMovieToFavorite(String token, String movieId,
      String name, double rating, String imageURL, String year) {
    return _favoritesOnlineDataSource.addMovieToFavorite(
        token, movieId, name, rating, imageURL, year);
  }

  @override
  Future<RemoveFavorite?> removeMovieFromFavorite(
      String token, String movieId) {
    return _favoritesOnlineDataSource.removeMovieFromFavorite(token, movieId);
  }

  @override
  Future<List<Favorites>?> getAllFavorites(String token) {
    return _favoritesOnlineDataSource.getAllFavorites(token);
  }

  @override
  Future<IsFavorite?> getMovieIsFavorite(String token, String movieId) {
    return _favoritesOnlineDataSource.getMovieIsFavorite(token, movieId);
  }
}
