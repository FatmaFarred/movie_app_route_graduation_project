import 'package:movie_app_route_graduation_project/domain/entities/change_password.dart';

/// message : "Password updated successfully"

class ChangePasswordResponse {
  ChangePasswordResponse({
    String? message,
  }) {
    _message = message;
  }

  ChangePasswordResponse.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
  ChangePasswordResponse copyWith({
    String? message,
  }) =>
      ChangePasswordResponse(
        message: message ?? _message,
      );
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

  ChangePassword toChangePassword(){
    return ChangePassword(message: message);
  }
}
