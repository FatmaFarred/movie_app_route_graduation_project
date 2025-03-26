import '../../data/model/movies/movies_response.dart';

abstract class SearchRepo{
  Future<MoviesResponse?> searchMovie(String search, int page);
}