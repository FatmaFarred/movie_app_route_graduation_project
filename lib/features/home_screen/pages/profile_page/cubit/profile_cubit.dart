import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/core/utils/app_constants.dart';

import 'package:movie_app_route_graduation_project/domain/use_cases/get_all_favorites_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/get_movie_from_history_use_case.dart';

import 'package:movie_app_route_graduation_project/domain/use_cases/get_profile_use_case.dart';

import '../../../../../api/errors/failure.dart';
import '../../../../../core/utils/prefs_manager.dart';
import '../../../../../data/model/movie/movie_model.dart';
import '../../../../../domain/entities/profile_entity.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase _getProfileUseCase;

  final GetAllFavoritesUseCase _getAllFavoritesUseCase;

  final GetMovieFromHistoryUseCase _getMovieFromHistoryUseCase;

  ProfileCubit(this._getProfileUseCase, this._getAllFavoritesUseCase,
      this._getMovieFromHistoryUseCase)
      : super(ProfileInitialState());

  Future<void> loadProfile() async {
    emit(ProfileLoadingState());
    String myToken =
        await PrefsManager.getData(key: AppConstants.prefsTokenKey) ?? "";
    try {
      var profileResponse = await _getProfileUseCase(myToken);
      var favoritesResponse = await _getAllFavoritesUseCase(myToken);
      var historyResponse = await _getMovieFromHistoryUseCase();
      emit(ProfileSuccessState(
          profileData: profileResponse,
          favoritesList: favoritesResponse,
          historyList: historyResponse));
    } catch (e) {
      if (e is Failure) {
        emit(ProfileErrorState(error: e));
      } else {
        emit(ProfileErrorState(error: Failure(errorMessage: e.toString())));
      }
    }
  }

  Future<void> logout(BuildContext context) async {
    await PrefsManager.removeData(key: AppConstants.prefsTokenKey);
  }
}
