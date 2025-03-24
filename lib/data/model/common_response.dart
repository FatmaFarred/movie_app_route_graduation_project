class CommonResponse {
  CommonResponse({
    String? message,
  }) {
    _message = message;
  }

  CommonResponse.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
  CommonResponse copyWith({
    String? message,
  }) =>
      CommonResponse(
        message: message ?? _message,
      );
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }
}
