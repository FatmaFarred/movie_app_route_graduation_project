import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/Api_constant.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/model/profile/delete_profile_response.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/profile_online_data_source.dart';
import 'package:movie_app_route_graduation_project/domain/entities/delete_profile.dart';
import 'package:movie_app_route_graduation_project/domain/entities/profile.dart';

import '../model/profile/profile_response.dart';
import '../model/profile/update_profile_response.dart';
import '../../domain/entities/update_profile.dart';
import '../Api_manager.dart';
import '../end_points.dart';
import '../errors/failure.dart';

@Injectable(as: ProfileOnlineDataSource)
class ProfileOnlineDataSourceImpl implements ProfileOnlineDataSource {
  final ApiManager _apiManager;

  ProfileOnlineDataSourceImpl(this._apiManager);

  @override
  Future<Profile?> getProfile(String token) async {
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
  Future<UpdateProfile?> updateProfile(
      String token, String name, String phone, int avatarId) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.patchData(url: ApiConstant.baseUrl,
          endPoint: EndPoints.profileApi,
          headers: {"Authorization": "Bearer $token"},
          data: {"name": name, "phone": phone, "avaterId": avatarId});
      var updateProfileResponse = UpdateProfileResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return updateProfileResponse.toUpdateProfile();
      } else {
        throw serverError(errorMessage: updateProfileResponse.message);
      }
    } else {
      throw NetworkError(errorMessage: "No Internet Connection");
    }
  }

  @override
  Future<DeleteProfile?> deleteProfile(String token) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.deleteData(
        endPoint: EndPoints.profileApi,
        headers: {"Authorization": "Bearer $token"},
      );
      var deleteProfileResponse = DeleteProfileResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return deleteProfileResponse.toDeleteProfile();
      } else {
        throw serverError(errorMessage: deleteProfileResponse.message);
      }
    } else {
      throw NetworkError(errorMessage: "No Internet Connection");
    }
  }
}
