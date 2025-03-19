import 'package:movie_app_route_graduation_project/domain/entities/delete_profile.dart';

import '../entities/profile.dart';
import '../entities/update_profile.dart';

abstract class ProfileRepo {
  Future<Profile?> getProfile(String token);

  Future<UpdateProfile?> updateProfile(
      String token, String name, String phone, int avatarId);

  Future<DeleteProfile?> deleteProfile(String token);
}
