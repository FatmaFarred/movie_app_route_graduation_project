import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import '../../../api/api_constant.dart';
import '../../../api/api_manager.dart';
import '../../../api/end_points.dart';
import '../../../api/errors/failure.dart';
import '../../../core/utils/app_constants.dart';
import '../../model/common_response.dart';
import '../change_password_online_data_source.dart';

@Injectable(as: ChangePasswordOnlineDataSource)
class ChangePasswordOnlineDataSourceImpl
    implements ChangePasswordOnlineDataSource {
  final ApiManager _apiManager;

  ChangePasswordOnlineDataSourceImpl(this._apiManager);

  @override
  Future<CommonResponse?> changePassword(
      String token, String oldPassword, String newPassword) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.patchData(
          url: ApiConstant.baseUrl,
          endPoint: EndPoints.changePasswordApi,
          headers: {"Authorization": "Bearer $token"},
          data: {"oldPassword": oldPassword, "newPassword": newPassword});
      var changePasswordResponse = CommonResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return changePasswordResponse;
      } else {
        throw ServerError(errorMessage: changePasswordResponse.message);
      }
    } else {
      throw NetworkError(errorMessage: AppConstants.noInternetConnection);
    }
  }
}
