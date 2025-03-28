/// message : "Favourite status fetched successfully"
/// data : true

class IsFavoriteResponse {
  IsFavoriteResponse({
    String? message,
    bool? data,
  }) {
    _message = message;
    _data = data;
  }

  IsFavoriteResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'];
  }

  String? _message;
  bool? _data;

  IsFavoriteResponse copyWith({
    String? message,
    bool? data,
  }) =>
      IsFavoriteResponse(
        message: message ?? _message,
        data: data ?? _data,
      );

  String? get message => _message;

  bool? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }
}
