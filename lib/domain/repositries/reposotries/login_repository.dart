import 'package:dartz/dartz.dart';

import 'package:movie_app_route_graduation_project/domain/entities/login_response_entity.dart';

import '../../../../api/errors/failure.dart';

abstract class LoginRepository {

  Future <Either<Failure,LoginResponseEntity>>login (String email , String password);



}