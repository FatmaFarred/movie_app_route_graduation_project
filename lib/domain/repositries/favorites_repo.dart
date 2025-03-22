import 'package:movie_app_route_graduation_project/domain/entities/add_favorite.dart';
import 'package:movie_app_route_graduation_project/domain/entities/favorites.dart';
import 'package:movie_app_route_graduation_project/domain/entities/is_favorite.dart';
import 'package:movie_app_route_graduation_project/domain/entities/remove_favorite.dart';

abstract class FavoritesRepo {
  Future<AddFavorite?> addMovieToFavorite(String token, String movieId,
      String name, double rating, String imageURL, String year);
  Future<RemoveFavorite?> removeMovieFromFavorite(String token, String movieId);
  Future<List<Favorites>?> getAllFavorites(String token);
  Future<IsFavorite?> getMovieIsFavorite(String token, String movieId);
}
