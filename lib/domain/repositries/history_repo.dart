import '../../data/model/movie/movie_model.dart';

abstract class HistoryRepo{
  Future<void> addMovieToHistory(MovieModel movie);

  Future<List<MovieModel>?> getMovieFromHistory();
}