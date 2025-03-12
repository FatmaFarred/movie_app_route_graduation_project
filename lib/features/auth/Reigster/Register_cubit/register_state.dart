

import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/domain/entities/RegisterResponseEntity.dart';

abstract class RegisterState {}

class IntialRegisterState extends RegisterState {}
class LoadingRegisterState extends RegisterState {}
class SuccessRegisterState extends RegisterState {
  RegisterResponseEntity response ;
  SuccessRegisterState ({required this.response});
}
class ErrorRegisterState extends RegisterState {
  Failure error;
  ErrorRegisterState({required this.error});
}
