import '../../data/model/movie/movie_model.dart';

abstract class CarouselRepo {
  Future<List<MovieModel>?> getCarouselMovies();
}