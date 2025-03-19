import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/features/auth/login/login_cubit/Login_state.dart';

import '../../../../domain/use_cases/Login_useCase.dart';


@injectable
class LoginViewModel extends Cubit<LoginState>{
  LoginUseCase useCase;
  var formkey=GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController(text: "Fatma78@gmail.com");
  final TextEditingController passwordController = TextEditingController(text:"Test2510@");


  LoginViewModel({required this.useCase}):super(IntialLoginState());

  void login ()async {
    if (formkey.currentState?.validate() == true) {
      emit(LoadingLoginState());
      var either=await useCase.invoke(emailController.text, passwordController.text);
      either.fold((error) {
        emit(ErrorLoginState(error: error));
      },
          (response) {
            emit(SuccessLoginState(response: response));


          }
      );


    }
  }



}