import '../model/common_response.dart';

abstract class ChangePasswordOnlineDataSource{
  Future<CommonResponse?> changePassword(String token, String oldPassword, String newPassword);
}