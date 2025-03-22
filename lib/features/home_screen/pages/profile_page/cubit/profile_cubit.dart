import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_app_route_graduation_project/domain/entities/favorites.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/get_all_favorites_use_case.dart';

import 'package:movie_app_route_graduation_project/domain/use_cases/get_profile_use_case.dart';

import '../../../../../Api manager/errors/failure.dart';

import '../../../../../core/shared_ preferences.dart';
import '../../../../../domain/entities/profile.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  GetProfileUseCase _getProfileUseCase;

  GetAllFavoritesUseCase _getAllFavoritesUseCase;

  ProfileSuccessState _profileSuccessState = ProfileSuccessState();

  ProfileCubit(this._getProfileUseCase, this._getAllFavoritesUseCase)
      : super(ProfileInitialState());

  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZDkwMjBiMDdhNjE1NzE0MDlhZDdhOCIsImVtYWlsIjoieW9qbzAyNThAZ21haWwuY29tIiwiaWF0IjoxNzQyMjc3NTUzfQ.pmam1Xhs59vd0F34xZkd4n7eOycYR6tGh-sxC8HF-Rg";

  Future<void> loadProfile() async {
    emit(ProfileLoadingState());
    String myToken = await Shared_preferences.getData(key: "token") ?? "";
    _getProfile(token);
    _getAllFavorites(token);
  }

  Future<void> _getProfile(String token) async {
    try {
      var response = await _getProfileUseCase(token);
      emit(_profileSuccessState =
          _profileSuccessState.copyWith(profileData: response));
    } catch (e) {
      if (e is Failure) {
        emit(ProfileErrorState(error: e));
      } else {
        emit(ProfileErrorState(error: Failure(errorMessage: e.toString())));
      }
    }
  }

  Future<void> _getAllFavorites(String token) async {
    try {
      var response = await _getAllFavoritesUseCase(token);
      emit(_profileSuccessState =
          _profileSuccessState.copyWith(favoritesList: response));
    } catch (e) {
      if (e is Failure) {
        emit(ProfileErrorState(error: e));
      } else {
        emit(ProfileErrorState(error: Failure(errorMessage: e.toString())));
      }
    }
  }

  Future<void> logout(BuildContext context) async {
    await Shared_preferences.removeData(key: "token");
  }
}
