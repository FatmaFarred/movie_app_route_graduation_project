import 'package:dartz/dartz.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/domain/entities/LoginResponseEntity.dart';
import 'package:movie_app_route_graduation_project/domain/entities/RegisterResponseEntity.dart';


abstract class RegisterRepositry {

Future <Either<Failure,RegisterResponseEntity>> register (String name , String email,String password ,
    String confirmPassword,String phone ,int avaterId   );


}