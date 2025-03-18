import 'package:movie_app_route_graduation_project/domain/entities/change_password.dart';

abstract class ChangePasswordRepo{
  Future<ChangePassword?> changePassword(String token, String oldPassword, String newPassword);
}