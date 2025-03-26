import 'package:dartz/dartz.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/domain/entities/LoginResponseEntity.dart';


abstract class LoginRemoteDatasource{

  Future <Either<Failure,LoginResponseEntity>>Login (String email , String password);


}