import 'package:injectable/injectable.dart';

import '../../data/model/movie/movie_model.dart';
import '../repositries/carousel_repo.dart';

@injectable
class GetCarouselMoviesUseCase {
  final CarouselRepo _carouselRepo;

  GetCarouselMoviesUseCase(this._carouselRepo);

  Future<List<MovieModel>?> execute() {
    return _carouselRepo.getCarouselMovies();
  }
}