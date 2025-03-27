import '../model/movie/movie_model.dart';

abstract class CarouselOnlineDataSource {
  Future<List<MovieModel>?> getCarouselMovies();
}