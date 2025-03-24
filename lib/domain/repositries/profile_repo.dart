import '../../data/model/common_response.dart';
import '../entities/profile_entity.dart';


abstract class ProfileRepo {
  Future<ProfileEntity?> getProfile(String token);

  Future<CommonResponse?> updateProfile(
      String token, String name, String phone, int avatarId);

  Future<CommonResponse?> deleteProfile(String token);
}
