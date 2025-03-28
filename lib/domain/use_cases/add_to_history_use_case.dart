import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/history_repo.dart';

import '../../data/model/movie/movie_model.dart';

@injectable
class AddToHistoryUseCase{
  final HistoryRepo _historyRepo;

  AddToHistoryUseCase(this._historyRepo);

  Future<void> call(MovieModel movie){
    return _historyRepo.addMovieToHistory(movie);
  }
}