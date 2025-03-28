import 'package:injectable/injectable.dart';

import '../../domain/repositries/carousel_repo.dart';
import '../data_sources/carousel_online_date_source.dart';
import '../model/movie/movie_model.dart';

@Injectable(as: CarouselRepo)
class CarouselRepoImpl implements CarouselRepo {
  final CarouselOnlineDataSource _carouselOnlineDataSource;

  CarouselRepoImpl(this._carouselOnlineDataSource);

  @override
  Future<List<MovieModel>?> getCarouselMovies() {
    return _carouselOnlineDataSource.getCarouselMovies();
  }
}