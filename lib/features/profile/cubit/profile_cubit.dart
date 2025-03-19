import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_route_graduation_project/core/shared_%20preferences.dart';
import 'package:movie_app_route_graduation_project/domain/entities/delete_profile.dart';
import 'package:movie_app_route_graduation_project/domain/entities/update_profile.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/delete_profile_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/get_profile_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/update_profile_use_case.dart';

import '../../../Api manager/errors/failure.dart';
import '../../../domain/entities/profile.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final DeleteProfileUseCase _deleteProfileUseCase;

  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZDkwMjBiMDdhNjE1NzE0MDlhZDdhOCIsImVtYWlsIjoieW9qbzAyNThAZ21haWwuY29tIiwiaWF0IjoxNzQyMjc1MDg3fQ.EvSVcTkYfWM6OtWLbSujG9Zb9J-eFo1yD3YzmYctZMo";

  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int selectedAvatar = -1;
  int avatarIndex = -1;

  ProfileCubit(this._getProfileUseCase, this._updateProfileUseCase,
      this._deleteProfileUseCase)
      : super(ProfileInitialState());

  Future<void> loadProfile() async {
    emit(ProfileLoadingState());
    try {
      var response = await _getProfileUseCase(token);
      nameController.text = response!.name!;
      phoneController.text = response.phone!;
      selectedAvatar = response.avaterId!;
      avatarIndex = selectedAvatar;
      emit(ProfileSuccessState(profileData: response));
    } catch (e) {
      if (e is Failure) {
        emit(ProfileErrorState(error: e));
      } else {
        emit(ProfileErrorState(error: Failure(errorMessage: e.toString())));
      }
    }
  }

  Future<void> updateProfile() async {
    String mytoken= await Shared_preferences.getData(key: "token");
    if (formKey.currentState?.validate() == true) {
      emit(UpdateProfileLoadingState());
      try {
        var response = await _updateProfileUseCase(
            mytoken, nameController.text, phoneController.text, avatarIndex);
        selectedAvatar = avatarIndex;
        emit(UpdateProfileSuccessState(updateProfile: response));
      } catch (e) {
        if (e is Failure) {
          emit(UpdateProfileErrorState(error: e));
        } else {
          emit(UpdateProfileErrorState(
              error: Failure(errorMessage: e.toString())));
        }
      }
    }
  }

  Future<void> deleteProfile() async {
    emit(DeleteProfileLoadingState());
    try {
      var response = await _deleteProfileUseCase(token);
      emit(DeleteProfileSuccessState(deleteProfile: response));
    } catch (e) {
      if (e is Failure) {
        emit(DeleteProfileErrorState(error: e));
      } else {
        emit(DeleteProfileErrorState(
            error: Failure(errorMessage: e.toString())));
      }
    }
  }
}
