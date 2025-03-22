import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/entities/is_favorite.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/favorites_repo.dart';

@injectable
class GetMovieIsFavoriteUseCase {
  FavoritesRepo _favoritesRepo;

  GetMovieIsFavoriteUseCase(this._favoritesRepo);

  Future<IsFavorite?> call(String token, String movieId) {
    return _favoritesRepo.getMovieIsFavorite(token, movieId);
  }
}
