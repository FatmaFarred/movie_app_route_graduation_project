import 'package:injectable/injectable.dart';

import '../../data/model/movie/movie_model.dart';
import '../repositries/genre_repo.dart';

@injectable
class GetGenreUseCase {
  GenreRepo _genreRepo;

  GetGenreUseCase(this._genreRepo);

  Future<List<MovieModel>?> call(String genre) {
    return _genreRepo.getGenre(genre);
  }
}
