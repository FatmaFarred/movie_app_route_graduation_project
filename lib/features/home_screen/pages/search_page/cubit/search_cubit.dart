import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/get_search_use_case.dart';

import '../../../../../Api manager/errors/failure.dart';
import '../../../../../data/model/MovieDetailsResponseDm.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  GetSearchUseCase _getSearchUseCase;

  SearchCubit(this._getSearchUseCase) : super(SearchInitialState());

  Future<void> searchMovie(String search) async {
    emit(SearchLoadingState());
    try {
      var result = await _getSearchUseCase(search);
      emit(SearchSuccessState(searchList: result));
    } catch (e) {
      if (e is Failure) {
        emit(SearchErrorState(error: e));
      } else {
        emit(SearchErrorState(error: Failure(errorMessage: e.toString())));
      }
    }
  }
}
