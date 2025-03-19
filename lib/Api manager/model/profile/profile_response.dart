import '../profile_dto.dart';

class ProfileResponse {
  ProfileResponse({
    String? message,
    ProfileDTO? data,
  }) {
    _message = message;
    _data = data;
  }

  ProfileResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? ProfileDTO.fromJson(json['data']) : null;
  }
  String? _message;
  ProfileDTO? _data;
  ProfileResponse copyWith({
    String? message,
    ProfileDTO? data,
  }) =>
      ProfileResponse(
        message: message ?? _message,
        data: data ?? _data,
      );
  String? get message => _message;
  ProfileDTO? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
