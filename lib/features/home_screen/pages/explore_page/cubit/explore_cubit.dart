import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../Api manager/errors/failure.dart';
import '../../../../../data/model/movie/movie_model.dart';
import '../../../../../domain/use_cases/get_genre_use_case.dart';

part 'explore_state.dart';

@injectable
class ExploreCubit extends Cubit<ExploreState> {
  GetGenreUseCase _getGenreUseCase;

  ExploreCubit(this._getGenreUseCase) : super(ExploreInitialState());

  Future<void> getGenre(String genre) async {
    emit(ExploreLoadingState());
    try {
      var response = await _getGenreUseCase(genre);
      emit(ExploreSuccessState(moviesList: response));
    } catch (e) {
      if (e is Failure) {
        emit(ExploreErrorState(error: e));
      } else {
        emit(ExploreErrorState(error: serverError(errorMessage: e.toString())));
      }
    }
  }
}
