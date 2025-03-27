import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/core/utils/app_constants.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/history_offline_data_source.dart';
import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';

@Injectable(as: HistoryOfflineDataSource)
class HistoryOfflineDataSourceImpl implements HistoryOfflineDataSource {

  @override
  Future<void> addMovieToHistory(MovieModel movie) async {
    var box = await Hive.openBox("MovieBox");
    await box.put(movie.movieId, movie);
    await box.close();
  }


   Future<List<MovieModel>?> getMovieFromHistory() async {
    var box = await Hive.openBox("MovieBox");

    List<MovieModel> historyMovies = [];
    for (var movie in box.values) {
      if (movie is MovieModel) {
        historyMovies.add(movie);
      }
    }
    return historyMovies ;
  }
}
