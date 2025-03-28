import 'package:dartz/dartz.dart';
import 'package:movie_app_route_graduation_project/domain/entities/register_response_entity.dart';

import '../../../../api/errors/failure.dart';


abstract  class RegisterRemoteDataSource {

  Future <Either<Failure,RegisterResponseEntity>> register (String name , String email,String password ,
      String confirmPassword,String phone ,int avaterId   );


}