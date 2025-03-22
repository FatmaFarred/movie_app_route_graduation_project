import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/Api_constant.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/Api_manager.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/model/change_password_response.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/change_password_online_data_source.dart';
import 'package:movie_app_route_graduation_project/domain/entities/change_password.dart';

import '../end_points.dart';
import '../errors/failure.dart';

@Injectable(as: ChangePasswordOnlineDataSource)
class ChangePasswordOnlineDataSourceImpl
    implements ChangePasswordOnlineDataSource {
  final ApiManager _apiManager;

  ChangePasswordOnlineDataSourceImpl(this._apiManager);

  @override
  Future<ChangePassword?> changePassword(
      String token, String oldPassword, String newPassword) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.patchData(url: ApiConstant.baseUrl,
          endPoint: EndPoints.changePasswordApi,
          headers: {"Authorization": "Bearer $token"},
          data: {"oldPassword": oldPassword, "newPassword": newPassword});
      var changePasswordResponse =
          ChangePasswordResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return changePasswordResponse.toChangePassword();
      } else {
        throw serverError(errorMessage: changePasswordResponse.message);
      }
    } else {
      throw NetworkError(errorMessage: "No Internet Connection");
    }
  }
}
