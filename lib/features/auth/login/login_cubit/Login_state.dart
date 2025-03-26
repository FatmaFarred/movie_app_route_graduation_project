

import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/domain/entities/LoginResponseEntity.dart';

abstract class LoginState {}

class IntialLoginState extends LoginState {}
class LoadingLoginState extends LoginState {}
class ErrorLoginState extends LoginState {
  Failure error;
  ErrorLoginState ({required this.error });

}
class SuccessLoginState extends LoginState {
  LoginResponseEntity  response;
  SuccessLoginState ({required this.response});


}
