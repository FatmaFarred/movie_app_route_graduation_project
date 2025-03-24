import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/favorites_repo.dart';

import '../../data/model/movie/movie_model.dart';

@injectable
class AddToFavoriteUseCase {
  FavoritesRepo _favoritesRepo;

  AddToFavoriteUseCase(this._favoritesRepo);

  Future<MovieModel?> call(String token, String movieId, String name,
      double rating, String imageURL, String year) {
    return _favoritesRepo.addMovieToFavorite(
        token, movieId, name, rating, imageURL, year);
  }
}
