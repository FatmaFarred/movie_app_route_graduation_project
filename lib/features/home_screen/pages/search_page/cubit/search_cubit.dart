import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/get_search_use_case.dart';

import '../../../../../api/errors/failure.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  GetSearchUseCase _getSearchUseCase;

  int currentPage = 1;
  int pageLimit = 20;
  int movieCount = 0;
  int totalPages = 0;
  List<MovieModel> searchList = [];
  bool isLoading = false;

  SearchCubit(this._getSearchUseCase) : super(SearchInitialState());

  Future<void> searchMovie(String search, {bool isLoadMore = false}) async {
    if (isLoadMore && currentPage > totalPages || isLoading) return;
    isLoading = true;

    if (!isLoadMore) {
      searchList.clear();
      currentPage = 1;
      emit(SearchLoadingState());
    }

    try {
      var response = await _getSearchUseCase(search, currentPage);

      movieCount = response?.data?.movieCount?.toInt() ?? 0;
      totalPages = (movieCount / pageLimit).ceil();

      var searchListResponse = response?.data?.movies
          ?.map((moviesDto) => moviesDto.toMovieModel())
          .toList() ?? [];

      searchList.addAll(searchListResponse);

      currentPage++;

      emit(SearchSuccessState(searchList: searchList));
    } catch (e) {
      if (e is Failure) {
        emit(SearchErrorState(error: e));
      } else {
        emit(SearchErrorState(error: Failure(errorMessage: e.toString())));
      }
    }
    isLoading = false;
  }
}
