import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/domain/entities/LoginResponseEntity.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/reposotries/Login_repositry.dart';
@injectable
class LoginUseCase{
  LoginRepositry loginRepositry ;
  LoginUseCase ({required this.loginRepositry});

  Future <Either<Failure,LoginResponseEntity>> invoke (String email , String password){
    return loginRepositry.Login(email, password);

  }


}