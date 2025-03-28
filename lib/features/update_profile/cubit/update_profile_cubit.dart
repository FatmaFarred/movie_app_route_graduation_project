import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/core/utils/app_constants.dart';
import 'package:movie_app_route_graduation_project/core/utils/prefs_manager.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/delete_profile_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/get_profile_use_case.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/update_profile_use_case.dart';

import '../../../api/errors/failure.dart';
import '../../../data/model/common_response.dart';
import '../../../domain/entities/profile_entity.dart';

part 'update_profile_state.dart';

@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final DeleteProfileUseCase _deleteProfileUseCase;

  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int selectedAvatar = -1;
  int avatarIndex = -1;

  late String myToken;

  UpdateProfileCubit(this._getProfileUseCase, this._updateProfileUseCase,
      this._deleteProfileUseCase)
      : super(ProfileInitialState());

  Future<void> loadProfile() async {
    myToken = await PrefsManager.getData(key: AppConstants.prefsTokenKey) ?? "";
    emit(ProfileLoadingState());
    try {
      var response = await _getProfileUseCase(myToken);
      nameController.text = response?.name ?? "";
      phoneController.text = response?.phone ?? "";
      selectedAvatar = response?.avaterId ?? 0;
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
    if (formKey.currentState?.validate() == true) {
      emit(UpdateProfileLoadingState());
      try {
        var response = await _updateProfileUseCase(
            myToken, nameController.text, phoneController.text, avatarIndex);
        selectedAvatar = avatarIndex;
        emit(UpdateProfileSuccessState(response: response));
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
      var response = await _deleteProfileUseCase(myToken);
      emit(DeleteProfileSuccessState(response: response));
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
