import '../../data/model/movie/movie_model.dart';

abstract class SuggestionRepo{
  Future<List<MovieModel>?> getSuggestionsMovies();
}