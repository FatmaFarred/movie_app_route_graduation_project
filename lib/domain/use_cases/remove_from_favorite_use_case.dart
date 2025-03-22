import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/favorites_repo.dart';

import '../entities/remove_favorite.dart';

@injectable
class RemoveFromFavoriteUseCase {
  FavoritesRepo _favoritesRepo;

  RemoveFromFavoriteUseCase(this._favoritesRepo);

  Future<RemoveFavorite?> call(String token, String movieId) {
    return _favoritesRepo.removeMovieFromFavorite(token, movieId);
  }
}
