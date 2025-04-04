import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/features/auth/register/Register_cubit/register_state.dart';

import '../../../../domain/use_cases/register_use_case.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var selectedAvatar = 0;
  int selectedIndex = 0;

  RegisterCubit({required this.registerUseCase})
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