import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_app_route_graduation_project/domain/entities/login_response_entity.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/reposotries/login_repository.dart';

import '../../../../api/errors/failure.dart';

@injectable
class LoginUseCase{
  LoginRepository loginRepositry ;
  LoginUseCase ({required this.loginRepositry});

  Future <Either<Failure,LoginResponseEntity>> invoke (String email , String password){
    return loginRepositry.login(email, password);

  }


}