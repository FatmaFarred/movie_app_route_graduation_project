import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_app_route_graduation_project/Api%20manager/Api_manager.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/end_points.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/errors/failure.dart';
import 'package:movie_app_route_graduation_project/data/model/RegisterResponseDm.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/data_sources/remote_data_sources/Register_remote_datasource.dart';
@Injectable(as: Register_remote_data_source)
class Register_remote_datasource_impl implements Register_remote_data_source{
  ApiManager apiManager;
  Register_remote_datasource_impl ({required this.apiManager });
  @override
  Future<Either<Failure, RegisterResponseDm>> register(String name, String email, String password, String confirmPassword, String phone, int avaterId)async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(
            endPoint: EndPoints.registerApi,
            data: {
              "name": name,
              "email": email,
              "password": password,
              "confirmPassword": confirmPassword,
              "phone": phone,
              "avaterId": avaterId
            }
        );
        print(response.data);
        var registerResponse = RegisterResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return left(serverError(errorMessage: registerResponse.message));
        }
      } else {
        return left(NetworkError(errorMessage: "No Ienternet Connection"));
      }
    }
  catch (e){
    return left(serverError(errorMessage: e.toString()));
  }

  }
  
}