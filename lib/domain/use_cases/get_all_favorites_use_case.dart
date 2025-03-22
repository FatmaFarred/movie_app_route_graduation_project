import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/favorites_repo.dart';

import '../entities/favorites.dart';

@injectable
class GetAllFavoritesUseCase {
  FavoritesRepo _favoritesRepo;

  GetAllFavoritesUseCase(this._favoritesRepo);

  Future<List<Favorites>?> call(String token) {
    return _favoritesRepo.getAllFavorites(token);
  }
}
