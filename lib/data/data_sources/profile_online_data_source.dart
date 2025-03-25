import '../../domain/entities/profile_entity.dart';
import '../model/common_response.dart';

abstract class ProfileOnlineDataSource {
  Future<ProfileEntity?> getProfile(String token);

  Future<CommonResponse?> updateProfile(
      String token, String name, String phone, int avatarId);

  Future<CommonResponse?> deleteProfile(String token);
}
