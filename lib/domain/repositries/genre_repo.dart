import '../../data/model/movies/movies_response.dart';

abstract class GenreRepo{
  Future<MoviesResponse?> getGenre(String genre, int page);
}