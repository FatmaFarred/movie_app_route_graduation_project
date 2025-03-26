import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/change_password_online_data_source.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/change_password_repo.dart';

import '../model/common_response.dart';

@Injectable(as: ChangePasswordRepo)
class ChangePasswordRepoImpl implements ChangePasswordRepo{
  final ChangePasswordOnlineDataSource _changePasswordOnlineDataSource;

  ChangePasswordRepoImpl(this._changePasswordOnlineDataSource);

  @override
  Future<CommonResponse?> changePassword(String token, String oldPassword, String newPassword) {
    return _changePasswordOnlineDataSource.changePassword(token, oldPassword, newPassword);
  }

}