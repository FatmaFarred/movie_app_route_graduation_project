import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/entities/profile.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/profile_repo.dart';

@injectable
class GetProfileUseCase {
  final ProfileRepo _profileRepo;

  GetProfileUseCase(this._profileRepo);

  Future<Profile?> call(String token) {
    return _profileRepo.getProfile(token);
  }
}
