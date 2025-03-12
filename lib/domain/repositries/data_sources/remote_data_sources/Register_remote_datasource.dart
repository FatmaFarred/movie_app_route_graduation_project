import 'package:dartz/dartz.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/domain/entities/RegisterResponseEntity.dart';


abstract  class Register_remote_data_source {

  Future <Either<Failure,RegisterResponseEntity>> register (String name , String email,String password ,
      String confirmPassword,String phone ,int avaterId   );


}