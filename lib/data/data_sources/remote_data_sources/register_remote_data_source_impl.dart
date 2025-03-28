import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/model/register_response_dm.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/data_sources/remote_data_sources/register_remote_data_source.dart';

import '../../../api/api_constant.dart';
import '../../../api/api_manager.dart';
import '../../../api/end_points.dart';
import '../../../api/errors/failure.dart';
import '../../../core/utils/app_constants.dart';

@Injectable(as: RegisterRemoteDataSource)
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  ApiManager apiManager;
  RegisterRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failure, RegisterResponseDm>> register(
      String name,
      String email,
      String password,
      String confirmPassword,
      String phone,
      int avaterId) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(
            url: ApiConstant.baseUrl,
            endPoint: EndPoints.registerApi,
            data: {
              "name": name,
              "email": email,
              "password": password,
              "confirmPassword": confirmPassword,
              "phone": phone,
              "avaterId": avaterId
            });
        if (kDebugMode) {
          print(response.data);
        }
        var registerResponse = RegisterResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return left(ServerError(errorMessage: registerResponse.message));
        }
      } else {
        return left(
            NetworkError(errorMessage: AppConstants.noInternetConnection));
      }
    } catch (e) {
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
