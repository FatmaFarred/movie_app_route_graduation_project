import '../../data/model/common_response.dart';
import '../../data/model/favorites/is_favorite_response.dart';
import '../../data/model/movie/movie_model.dart';

abstract class FavoritesRepo {
  Future<MovieModel?> addMovieToFavorite(String token, String movieId,
      String name, double rating, String imageURL, String year);
  Future<CommonResponse?> removeMovieFromFavorite(String token, String movieId);
  Future<List<MovieModel>?> getAllFavorites(String token);
  Future<IsFavoriteResponse?> getMovieIsFavorite(String token, String movieId);
}
