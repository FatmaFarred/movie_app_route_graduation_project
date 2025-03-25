import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';

abstract class GenreRepo{
  Future<List<MovieModel>?> getGenre(String genre);
}