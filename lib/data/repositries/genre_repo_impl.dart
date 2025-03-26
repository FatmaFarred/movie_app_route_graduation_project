import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/genre_repo.dart';

import '../data_sources/genre_online_data_source.dart';
import '../model/movies/movies_response.dart';

@Injectable(as: GenreRepo)
class GenreRepoImpl implements GenreRepo{
  GenreOnlineDataSource _genreOnlineDataSource;

  GenreRepoImpl(this._genreOnlineDataSource);

  @override
  Future<MoviesResponse?> getGenre(String genre, int page) {
    return _genreOnlineDataSource.getGenre(genre, page);
  }
}