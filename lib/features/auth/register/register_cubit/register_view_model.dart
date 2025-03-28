import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/use_cases/register_use_case.dart';

import 'register_state.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController(text: "Fatma78@gmail.com");
  var nameController = TextEditingController(text: "fatma");
  var passwordController = TextEditingController(text: "Fatm2510@");
  var confirmPasswordController = TextEditingController(text: "Fatm2510@");
  var phoneNumberController = TextEditingController(text: "+201277140023");
  var selectedAvatar = 0;
  int selectedIndex = 0;

  RegisterViewModel({required this.registerUseCase})
      : super(IntialRegisterState());

  void register() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoadingRegisterState());
      var either = await registerUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          confirmPasswordController.text,
          phoneNumberController.text,
          selectedIndex);
      either.fold((error) {
        emit(ErrorRegisterState(error: error));
      }, (response) {
        emit(SuccessRegisterState(response: response));
      });
    }
  }
}
