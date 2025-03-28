import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../api/errors/failure.dart';
import '../../../../../data/model/movie/movie_model.dart';
import '../../../../../domain/use_cases/get_genre_use_case.dart';

part 'explore_state.dart';

@injectable
class ExploreCubit extends Cubit<ExploreState> {
  GetGenreUseCase _getGenreUseCase;

  int currentPage = 1;
  int pageLimit = 20;
  int movieCount = 0;
  int totalPages = 0;
  List<MovieModel> moviesList = [];
  bool isLoading = false;

  ExploreCubit(this._getGenreUseCase) : super(ExploreInitialState());

  Future<void> getGenre(String genre, {bool isLoadMore = false}) async {
    if (isLoadMore && currentPage > totalPages || isLoading) return;
    isLoading = true;

    if (!isLoadMore) {
      moviesList.clear();
      currentPage = 1;
      emit(ExploreLoadingState());
    }

    try {
      var response = await _getGenreUseCase(genre, currentPage);

      movieCount = response?.data?.movieCount?.toInt() ?? 0;
      totalPages = (movieCount / pageLimit).ceil();

      var moviesListResponse = response?.data?.movies
          ?.map((moviesDto) => moviesDto.toMovieModel())
          .toList() ?? [];

      moviesList.addAll(moviesListResponse);

      currentPage++;

      emit(ExploreSuccessState(moviesList: moviesList));
    } catch (e) {
      if (e is Failure) {
        emit(ExploreErrorState(error: e));
      } else {
        emit(ExploreErrorState(error: ServerError(errorMessage: e.toString())));
      }
    }
    isLoading = false;
  }
}
