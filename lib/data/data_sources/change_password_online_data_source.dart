import 'package:movie_app_route_graduation_project/domain/entities/change_password.dart';

abstract class ChangePasswordOnlineDataSource{
  Future<ChangePassword?> changePassword(String token, String oldPassword, String newPassword);
}