import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/search_repo.dart';

import '../../data/model/movies/movies_response.dart';


@injectable
class GetSearchUseCase {
  SearchRepo _searchRepo;

  GetSearchUseCase(this._searchRepo);

  Future<MoviesResponse?> call(String search, int page) {
    return _searchRepo.searchMovie(search, page);
  }
}
