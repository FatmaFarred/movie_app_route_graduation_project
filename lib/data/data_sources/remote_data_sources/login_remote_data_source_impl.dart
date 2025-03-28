import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/core/utils/prefs_manager.dart';
import 'package:movie_app_route_graduation_project/data/model/login_response_dm.dart';

import '../../../api/api_constant.dart';
import '../../../api/api_manager.dart';
import '../../../api/end_points.dart';
import '../../../api/errors/failure.dart';
import '../../../core/utils/app_constants.dart';
import '../../../domain/repositries/data_sources/remote_data_sources/login_remote_data_source.dart'
    show LoginRemoteDataSource;

@Injectable(as:LoginRemoteDataSource )
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  ApiManager apiManager;

  LoginRemoteDataSourceImpl({required this.apiManager });

  @override
  Future<Either<Failure, LoginResponseDm>> login(String email,
      String password) async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(endPoint: EndPoints.loginApi,
          url: ApiConstant.baseUrl,
          data: {
            "email": email,
            "password": password
          },);
        var loginResponse = LoginResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          PrefsManager.saveData(key: AppConstants.prefsTokenKey, value: loginResponse.data);
          return right(loginResponse);
        } else {
          return left(ServerError(errorMessage: loginResponse.message));
        }
      } else {
        return left(NetworkError(errorMessage: AppConstants.noInternetConnection));
      }
    }
    catch (e) {
      return left(NetworkError(errorMessage: e.toString()));
    }
  }
}




