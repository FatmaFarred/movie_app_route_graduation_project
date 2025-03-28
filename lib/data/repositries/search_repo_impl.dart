import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/search_repo.dart';

import '../data_sources/search_online_data_source.dart';
import '../model/movies/movies_response.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo{
  final SearchOnlineDataSource _searchOnlineDataSource;

  SearchRepoImpl(this._searchOnlineDataSource);

  @override
  Future<MoviesResponse?> searchMovie(String search, int page) {
    return _searchOnlineDataSource.searchMovie(search, page);
  }
}