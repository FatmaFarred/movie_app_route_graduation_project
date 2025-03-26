import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/search_repo.dart';


@injectable
class GetSearchUseCase {
  SearchRepo _searchRepo;

  GetSearchUseCase(this._searchRepo);

  Future<List<MovieModel>?> call(String search) {
    return _searchRepo.searchMovie(search);
  }
}
