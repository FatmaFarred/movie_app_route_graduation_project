import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/Api_constant.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/profile_online_data_source.dart';
import 'package:movie_app_route_graduation_project/domain/entities/profile_entity.dart';


import '../../../Api manager/Api_manager.dart';
import '../../../Api manager/end_points.dart';
import '../../../Api manager/errors/failure.dart';
import '../../model/common_response.dart';
import '../../model/profile/profile_response.dart';

@Injectable(as: ProfileOnlineDataSource)
class ProfileOnlineDataSourceImpl implements ProfileOnlineDataSource {
  final ApiManager _apiManager;

  ProfileOnlineDataSourceImpl(this._apiManager);

  @override
  Future<ProfileEntity?> getProfile(String token) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.getData(url: ApiConstant.baseUrl,
          endPoint: EndPoints.profileApi,
          headers: {"Authorization": "Bearer $token"});
      var profileResponse = ProfileResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return profileResponse.data?.toProfile();
      } else {
        throw serverError(errorMessage: profileResponse.message);
      }
    } else {
      throw NetworkError(errorMessage: "No Internet Connection");
    }
  }

  @override
  Future<CommonResponse?> updateProfile(
      String token, String name, String phone, int avatarId) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.patchData(url: ApiConstant.baseUrl,
          endPoint: EndPoints.profileApi,
          headers: {"Authorization": "Bearer $token"},
          data: {"name": name, "phone": phone, "avaterId": avatarId});
      var updateProfileResponse = CommonResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return updateProfileResponse;
      } else {
        throw serverError(errorMessage: updateProfileResponse.message);
      }
    } else {
      throw NetworkError(errorMessage: "No Internet Connection");
    }
  }

  @override
  Future<CommonResponse?> deleteProfile(String token) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.deleteData(
        endPoint: EndPoints.profileApi,
        headers: {"Authorization": "Bearer $token"},
      );
      var deleteProfileResponse = CommonResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return deleteProfileResponse;
      } else {
        throw serverError(errorMessage: deleteProfileResponse.message);
      }
    } else {
      throw NetworkError(errorMessage: "No Internet Connection");
    }
  }
}
