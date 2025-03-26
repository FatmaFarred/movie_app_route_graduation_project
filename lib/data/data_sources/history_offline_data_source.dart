import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';

abstract class HistoryOfflineDataSource {
  Future<void> addMovieToHistory(MovieModel movie);

  Future<List<MovieModel>?> getMovieFromHistory();
}