import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/domain/entities/change_password.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/change_password_repo.dart';

@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepo _changePasswordRepo;

  ChangePasswordUseCase(this._changePasswordRepo);

  Future<ChangePassword?> call(String token, String oldPassword, String newPassword) {
    return _changePasswordRepo.changePassword(token, oldPassword, newPassword);
  }
}
