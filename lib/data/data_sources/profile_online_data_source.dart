import '../../domain/entities/delete_profile.dart';
import '../../domain/entities/profile.dart';
import '../../domain/entities/update_profile.dart';

abstract class ProfileOnlineDataSource {
  Future<Profile?> getProfile(String token);

  Future<UpdateProfile?> updateProfile(
      String token, String name, String phone, int avatarId);

  Future<DeleteProfile?> deleteProfile(String token);
}
