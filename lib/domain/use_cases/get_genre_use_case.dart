import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/model/movies/movies_response.dart';

import '../repositries/genre_repo.dart';

@injectable
class GetGenreUseCase {
  final GenreRepo _genreRepo;

  GetGenreUseCase(this._genreRepo);

  Future<MoviesResponse?> call(String genre, int page) {
    return _genreRepo.getGenre(genre, page);
  }
}
