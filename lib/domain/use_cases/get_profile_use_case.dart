import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/entities/profile_entity.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/profile_repo.dart';

@injectable
class GetProfileUseCase {
  final ProfileRepo _profileRepo;

  GetProfileUseCase(this._profileRepo);

  Future<ProfileEntity?> call(String token) {
    return _profileRepo.getProfile(token);
  }
}
