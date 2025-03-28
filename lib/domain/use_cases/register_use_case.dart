import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_app_route_graduation_project/domain/entities/register_response_entity.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/reposotries/auth_repositry.dart';

import '../../../../api/errors/failure.dart';
@injectable
class RegisterUseCase {
 RegisterRepositry registerRepositry;

 RegisterUseCase ({required this.registerRepositry});
   Future <Either<Failure,RegisterResponseEntity>>invoke(String name , String email,
       String password , String confirmPassword,String phone ,int avaterId ){
     return registerRepositry.register(name, email, password, confirmPassword, phone, avaterId);
   }


}