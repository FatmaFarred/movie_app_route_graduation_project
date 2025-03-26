import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/data/model/common_response.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/change_password_use_case.dart';

part 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase _changePasswordUseCase;

  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZDkwMjBiMDdhNjE1NzE0MDlhZDdhOCIsImVtYWlsIjoieW9qbzAyNThAZ21haWwuY29tIiwiaWF0IjoxNzQyMjc1MDg3fQ.EvSVcTkYfWM6OtWLbSujG9Zb9J-eFo1yD3YzmYctZMo";

  var formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  ChangePasswordCubit(this._changePasswordUseCase)
      : super(ChangePasswordInitialState());

  Future<void> changePassword() async {
    if (formKey.currentState!.validate()) {
      emit(ChangePasswordLoadingState());
      try {
        var response = await _changePasswordUseCase(
            token, oldPasswordController.text, newPasswordController.text);
        emit(ChangePasswordSuccessState(response: response));
      } catch (e) {
        if (e is Failure) {
          emit(ChangePasswordErrorState(error: e));
        } else {
          emit(ChangePasswordErrorState(
              error: Failure(errorMessage: e.toString())));
        }
      }
    }
  }
}
