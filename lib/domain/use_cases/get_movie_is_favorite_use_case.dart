import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/favorites_repo.dart';

import '../../data/model/favorites/is_favorite_response.dart';

@injectable
class GetMovieIsFavoriteUseCase {
  FavoritesRepo _favoritesRepo;

  GetMovieIsFavoriteUseCase(this._favoritesRepo);

  Future<IsFavoriteResponse?> call(String token, String movieId) {
    return _favoritesRepo.getMovieIsFavorite(token, movieId);
  }
}
