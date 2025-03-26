import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/history_repo.dart';

import '../../data/model/movie/movie_model.dart';

@injectable
class GetMovieFromHistoryUseCase{
  HistoryRepo _historyRepo;

  GetMovieFromHistoryUseCase(this._historyRepo);

  Future<List<MovieModel>?> call(){
    return _historyRepo.getMovieFromHistory();
  }
}