import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/history_offline_data_source.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/history_repo.dart';

import '../model/movie/movie_model.dart';

@Injectable(as: HistoryRepo)
class HistoryRepoImpl implements HistoryRepo{

  final HistoryOfflineDataSource _historyOfflineDataSource;

  HistoryRepoImpl(this._historyOfflineDataSource);

  @override
  Future<void> addMovieToHistory(MovieModel movie) {
    return _historyOfflineDataSource.addMovieToHistory(movie);
  }

  @override
  Future<List<MovieModel>?> getMovieFromHistory() {
    return _historyOfflineDataSource.getMovieFromHistory();
  }

}