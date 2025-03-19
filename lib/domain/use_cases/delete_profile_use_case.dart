import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/profile_repo.dart';

import '../entities/delete_profile.dart';

@injectable
class DeleteProfileUseCase{
  final ProfileRepo _profileRepo;

  DeleteProfileUseCase(this._profileRepo);

  Future<DeleteProfile?> call(String token){
    return _profileRepo.deleteProfile(token);
  }
}