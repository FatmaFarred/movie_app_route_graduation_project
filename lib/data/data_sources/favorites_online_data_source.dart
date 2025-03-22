import '../../domain/entities/add_favorite.dart';
import '../../domain/entities/favorites.dart';
import '../../domain/entities/is_favorite.dart';
import '../../domain/entities/remove_favorite.dart';

abstract class FavoritesOnlineDataSource {
  Future<AddFavorite?> addMovieToFavorite(String token, String movieId,
      String name, double rating, String imageURL, String year);
  Future<RemoveFavorite?> removeMovieFromFavorite(String token, String movieId);
  Future<List<Favorites>?> getAllFavorites(String token);
  Future<IsFavorite?> getMovieIsFavorite(String token, String movieId);
}
