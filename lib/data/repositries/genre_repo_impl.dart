import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/genre_repo.dart';

import '../data_sources/genre_online_data_source.dart';
import '../model/movie/movie_model.dart';

@Injectable(as: GenreRepo)
class GenreRepoImpl implements GenreRepo{
  GenreOnlineDataSource _genreOnlineDataSource;

  GenreRepoImpl(this._genreOnlineDataSource);

  @override
  Future<List<MovieModel>?> getGenre(String genre) {
    return _genreOnlineDataSource.getGenre(genre);
  }
}