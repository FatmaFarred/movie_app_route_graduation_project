import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/profile_online_data_source.dart';
import 'package:movie_app_route_graduation_project/domain/entities/delete_profile.dart';
import 'package:movie_app_route_graduation_project/domain/entities/profile.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/profile_repo.dart';

import '../../domain/entities/update_profile.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileOnlineDataSource _profileOnlineDataSource;

  ProfileRepoImpl(this._profileOnlineDataSource);

  @override
  Future<Profile?> getProfile(String token) {
    return _profileOnlineDataSource.getProfile(token);
  }

  @override
  Future<UpdateProfile?> updateProfile(
      String token, String name, String phone, int avatarId) {
    return _profileOnlineDataSource.updateProfile(token, name, phone, avatarId);
  }

  @override
  Future<DeleteProfile?> deleteProfile(String token) {
    return _profileOnlineDataSource.deleteProfile(token);
  }
}
