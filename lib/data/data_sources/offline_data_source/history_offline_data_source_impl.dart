import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/core/utils/app_constants.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/history_offline_data_source.dart';
import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';

@Injectable(as: HistoryOfflineDataSource)
class HistoryOfflineDataSourceImpl implements HistoryOfflineDataSource {

  @override
  Future<void> addMovieToHistory(MovieModel movie) async {
    var box = await Hive.openBox<MovieModel>(AppConstants.hiveHistoryBox);

    if (box.length >= AppConstants.historyBoxLimit) {
      await box.deleteAt(0);
    }

    await box.add(movie);
  }

  @override
  Future<List<MovieModel>?> getMovieFromHistory() async {
    var box = await Hive.openBox<MovieModel>(AppConstants.hiveHistoryBox);
    return box.values.toList();
  }
}
