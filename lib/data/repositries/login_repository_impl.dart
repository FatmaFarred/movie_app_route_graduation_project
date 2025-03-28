import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../api/errors/failure.dart';
import '../../domain/entities/login_response_entity.dart';
import '../../domain/repositries/data_sources/remote_data_sources/login_remote_data_source.dart';
import '../../domain/repositries/reposotries/login_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginRemoteDataSource loginRemoteDatasource;
  LoginRepositoryImpl({required this.loginRemoteDatasource});

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
      String email, String password) async {
    var either = await loginRemoteDatasource.login(email, password);
    return either.fold((error) => left(error), (response) => right(response));
  }
}
