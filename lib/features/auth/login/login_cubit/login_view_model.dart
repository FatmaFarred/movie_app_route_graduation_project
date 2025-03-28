import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/api/errors/failure.dart';
import 'package:movie_app_route_graduation_project/features/auth/login/login_cubit/login_state.dart';

import '../../../../domain/use_cases/login_use_case.dart';
import '../../../../domain/use_cases/register_use_case.dart';
import '../../../../domain/use_cases/google_login_use_case.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginUseCase useCase;
  GoogleLoginUseCase googleUseCase;
  RegisterUseCase registerUseCase;

  var formKey = GlobalKey<FormState>();

  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();

  LoginViewModel(
      {required this.useCase,
      required this.googleUseCase,
      required this.registerUseCase})
      : super(InitialLoginState());

  void login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoadingLoginState());
      var either =
          await useCase.invoke(emailController.text, passwordController.text);
      either.fold((error) {
        emit(ErrorLoginState(error: error));
      }, (response) {
        emit(SuccessLoginState(response: response));
      });
    }
  }

  Future<void> loginWithGoogle() async {
    emit(LoadingLoginState());
    try {
      var googleUser = await googleUseCase();
      if (googleUser == null) {
        emit(ErrorLoginState(error: Failure(errorMessage: 'Login failed')));
      }else{
        await registerFromGoogle(googleUser);
      }
    } catch (e) {
      emit(ErrorLoginState(error: Failure(errorMessage: 'Login failed')));
    }
  }

  Future<void> registerFromGoogle(User user) async {
    var either = await registerUseCase.invoke(
        user.displayName ?? "",
        user.email ?? "",
        "${user.uid}@",
        "${user.uid}@",
        "+201234567891",
        0);
    either.fold((error) async {
      await customLogin(user.email ?? "", "${user.uid}@");
    }, (response) async {
      await customLogin(user.email ?? "", "${user.uid}@");
    });
  }

  Future<void> customLogin(String email, String password) async {
    var either =
    await useCase.invoke(email, password);
    either.fold((error) {
      emit(ErrorLoginState(error: error));
    }, (response) {
      emit(SuccessLoginState(response: response));
    });
  }
}
