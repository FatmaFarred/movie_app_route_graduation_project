import 'package:movie_app_route_graduation_project/domain/entities/update_profile.dart';

/// message : "Profile updated successfully"

class UpdateProfileResponse {
  UpdateProfileResponse({
    String? message,
  }) {
    _message = message;
  }

  UpdateProfileResponse.fromJson(dynamic json) {
    _message = json['message'];
  }

  String? _message;

  UpdateProfileResponse copyWith({
    String? message,
  }) =>
      UpdateProfileResponse(
        message: message ?? _message,
      );

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

  UpdateProfile? toUpdateProfile() {
    return UpdateProfile(message: message);
  }
}
