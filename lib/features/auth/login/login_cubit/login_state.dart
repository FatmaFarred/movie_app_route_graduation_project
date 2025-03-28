import 'package:movie_app_route_graduation_project/domain/entities/login_response_entity.dart';

import '../../../../api/errors/failure.dart';

abstract class LoginState {}

class InitialLoginState extends LoginState {}
class LoadingLoginState extends LoginState {}
class ErrorLoginState extends LoginState {
  Failure error;
  ErrorLoginState ({required this.error });

}
class SuccessLoginState extends LoginState {
  LoginResponseEntity  response;
  SuccessLoginState ({required this.response});


}
