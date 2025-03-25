import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/favorites_repo.dart';

import '../../data/model/common_response.dart';

@injectable
class RemoveFromFavoriteUseCase {
  FavoritesRepo _favoritesRepo;

  RemoveFromFavoriteUseCase(this._favoritesRepo);

  Future<CommonResponse?> call(String token, String movieId) {
    return _favoritesRepo.removeMovieFromFavorite(token, movieId);
  }
}
