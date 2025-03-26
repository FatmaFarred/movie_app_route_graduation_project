import '../model/movies/movies_response.dart';

abstract class SearchOnlineDataSource{
  Future<MoviesResponse?> searchMovie(String search, int page);
}