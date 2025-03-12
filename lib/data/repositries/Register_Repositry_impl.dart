import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/domain/entities/RegisterResponseEntity.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/data_sources/remote_data_sources/Register_remote_datasource.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/reposotries/auth_repositry.dart';
@Injectable(as: RegisterRepositry)
class Register_repositry_impl implements RegisterRepositry{

  Register_remote_data_source register_remote_data_source;
  Register_repositry_impl ({required this.register_remote_data_source});
  @override
  Future<Either<Failure, RegisterResponseEntity>> register(String name, String email, String password, String confirmPassword, String phone, int avaterId)async {
   var either= await register_remote_data_source.register(name, email, password, confirmPassword, phone, avaterId);
   return either.fold((error)=>left(error),

       (response)=>right(response));
  }
  
  
  
}