import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/Api_manager.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/end_points.dart';
import 'package:movie_app_route_graduation_project/core/shared_%20preferences.dart';
import 'package:movie_app_route_graduation_project/data/model/LoginResponseDm.dart';

import '../../../Api manager/errors/failure.dart' show Failure, NetworkError, serverError;
import '../../../domain/repositries/data_sources/remote_data_sources/Login_remote_datasource.dart' show LoginRemoteDatasource;

@Injectable(as:LoginRemoteDatasource )
class LoginRemoteDataSourceImpl implements LoginRemoteDatasource {
  ApiManager apiManager;

  LoginRemoteDataSourceImpl({required this.apiManager });

  @override
  Future<Either<Failure, LoginResponseDm>> Login(String email,
      String password) async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(endPoint: EndPoints.loginApi,
          data: {
            "email": email,
            "password": password
          },);
        var loginResponse = LoginResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          Shared_preferences.saveData(key: "token", value: loginResponse.data);
          return right(loginResponse);
        } else {
          return left(serverError(errorMessage: loginResponse.message));
        }
      } else {
        return left(NetworkError(errorMessage: "NoInternet Connecteion"));
      }
    }
    catch (e) {
      return left(NetworkError(errorMessage: e.toString()));
    }
  }
}




