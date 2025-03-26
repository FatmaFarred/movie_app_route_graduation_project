import '../model/movies/movies_response.dart';

abstract class GenreOnlineDataSource{
  Future<MoviesResponse?> getGenre(String genre, int page);
}