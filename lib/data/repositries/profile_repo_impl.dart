import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/profile_online_data_source.dart';
import 'package:movie_app_route_graduation_project/domain/entities/profile_entity.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/profile_repo.dart';

import '../model/common_response.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileOnlineDataSource _profileOnlineDataSource;

  ProfileRepoImpl(this._profileOnlineDataSource);

  @override
  Future<ProfileEntity?> getProfile(String token) {
    return _profileOnlineDataSource.getProfile(token);
  }

  @override
  Future<CommonResponse?> updateProfile(
      String token, String name, String phone, int avatarId) {
    return _profileOnlineDataSource.updateProfile(token, name, phone, avatarId);
  }

  @override
  Future<CommonResponse?> deleteProfile(String token) {
    return _profileOnlineDataSource.deleteProfile(token);
  }
}
