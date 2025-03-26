import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/core/routes_manager/routes.dart';
import 'package:movie_app_route_graduation_project/core/shared_%20preferences.dart';

import 'package:movie_app_route_graduation_project/domain/use_cases/Register_usecase.dart';

import 'register_state.dart';
@injectable
class RegisterViewModel extends Cubit<RegisterState>{

 RegisterUseCase registerUseCase ;
 var formkey=GlobalKey<FormState>();
 var  emailController = TextEditingController(text: "Fatma78@gmail.com");
 var nameController = TextEditingController(text: "fatma" );
 var passwordController = TextEditingController(text:"Fatm2510@");
 var confirmpasswordController  = TextEditingController(text:"Fatm2510@");
 var phonenumberController = TextEditingController(text:"+201277140023");
 var selectedAvater=0;
 int selectedindex=0;


 RegisterViewModel( {required this.registerUseCase}):super(IntialRegisterState());

  void Register () async {
    if (formkey.currentState?.validate() == true) {
      bool showOnboarding = await Shared_preferences.getData(key: Routes.onBoardingRoute)??false ;
      print("the result is $showOnboarding");

      emit(LoadingRegisterState());
      var either = await registerUseCase.invoke(
          nameController.text, emailController.text,
          passwordController.text, confirmpasswordController.text,
          phonenumberController.text, selectedindex+1);
      either.fold((error) {
        emit(ErrorRegisterState(error: error));
      },
              (response) {
            emit(SuccessRegisterState(response: response));
          }
      );
    }
  }



}