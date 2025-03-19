import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/profile_repo.dart';

import '../entities/update_profile.dart';

@injectable
class UpdateProfileUseCase {
  final ProfileRepo _profileRepo;

  UpdateProfileUseCase(this._profileRepo);

  Future<UpdateProfile?> call(
      String token, String name, String phone, int avatarId) {
    return _profileRepo.updateProfile(token, name, phone, avatarId);
  }
}
