import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';

import '../../domain/entities/LoginResponseEntity.dart' show LoginResponseEntity;
import '../../domain/repositries/data_sources/remote_data_sources/Login_remote_datasource.dart' show LoginRemoteDatasource;
import '../../domain/repositries/reposotries/Login_repositry.dart' show LoginRepositry;
@Injectable(as:LoginRepositry )
class LoginRepositryImpl implements LoginRepositry{
  LoginRemoteDatasource loginRemoteDatasource;
  LoginRepositryImpl ({required this.loginRemoteDatasource});
  
  @override
  Future<Either<Failure, LoginResponseEntity>> Login(String email, String password)async {
   var either=await  loginRemoteDatasource.Login(email, password);
   return either.fold((error)=>left(error), (response)=>right(response));
  }


  
  
  
}