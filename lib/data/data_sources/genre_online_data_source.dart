import '../model/movie/movie_model.dart';

abstract class GenreOnlineDataSource{
  Future<List<MovieModel>?> getGenre(String genre);
}