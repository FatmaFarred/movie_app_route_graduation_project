import '../../../../api/errors/failure.dart';
import '../../../../domain/entities/register_response_entity.dart';

abstract class RegisterState {}

class IntialRegisterState extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class SuccessRegisterState extends RegisterState {
  RegisterResponseEntity response;

  SuccessRegisterState({required this.response});
}

class ErrorRegisterState extends RegisterState {
  Failure error;

  ErrorRegisterState({required this.error});
}
