import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/search_repo.dart';

import '../data_sources/search_online_data_source.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo{
  SearchOnlineDataSource _searchOnlineDataSource;

  SearchRepoImpl(this._searchOnlineDataSource);

  @override
  Future<List<MovieModel>?> searchMovie(String search) {
    return _searchOnlineDataSource.searchMovie(search);
  }
}