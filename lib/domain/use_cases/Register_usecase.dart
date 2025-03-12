import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/domain/entities/RegisterResponseEntity.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/reposotries/auth_repositry.dart';
@injectable
class RegisterUseCase {
 RegisterRepositry registerRepositry;

 RegisterUseCase ({required this.registerRepositry});
   Future <Either<Failure,RegisterResponseEntity>>invoke(String name , String email,
       String password , String confirmPassword,String phone ,int avaterId ){
     return registerRepositry.register(name, email, password, confirmPassword, phone, avaterId);
   }


}