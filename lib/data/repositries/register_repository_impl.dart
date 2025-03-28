import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_app_route_graduation_project/domain/entities/register_response_entity.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/data_sources/remote_data_sources/register_remote_data_source.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/reposotries/auth_repositry.dart';

import '../../api/errors/failure.dart';

@Injectable(as: RegisterRepositry)
class RegisterRepositoryImpl implements RegisterRepositry {
  RegisterRemoteDataSource register_remote_data_source;
  RegisterRepositoryImpl({required this.register_remote_data_source});
  @override
  Future<Either<Failure, RegisterResponseEntity>> register(
      String name,
      String email,
      String password,
      String confirmPassword,
      String phone,
      int avaterId) async {
    var either = await register_remote_data_source.register(
        name, email, password, confirmPassword, phone, avaterId);
    return either.fold((error) => left(error), (response) => right(response));
  }
}
