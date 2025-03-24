import '../../data/model/common_response.dart';

abstract class ChangePasswordRepo{
  Future<CommonResponse?> changePassword(String token, String oldPassword, String newPassword);
}