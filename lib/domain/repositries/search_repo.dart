import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';

abstract class SearchRepo{
  Future<List<MovieModel>?> searchMovie(String search);
}