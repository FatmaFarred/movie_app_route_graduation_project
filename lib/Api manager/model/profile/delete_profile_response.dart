import 'package:movie_app_route_graduation_project/domain/entities/delete_profile.dart';

/// message : "Profile deleted successfully"

class DeleteProfileResponse {
  DeleteProfileResponse({
    String? message,
  }) {
    _message = message;
  }

  DeleteProfileResponse.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
  DeleteProfileResponse copyWith({
    String? message,
  }) =>
      DeleteProfileResponse(
        message: message ?? _message,
      );
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

  DeleteProfile? toDeleteProfile() {
    return DeleteProfile(message: message);
  }
}
