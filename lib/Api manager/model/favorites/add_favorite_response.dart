import 'add_favorite_dto.dart';

/// message : "Added to favourite successfully"
/// data : {"movieId":"movieId1","name":"test","rating":2.4,"imageURL":"https//imagelink","year":"2002"}

class AddFavoriteResponse {
  AddFavoriteResponse({
    String? message,
    AddFavoriteDto? data,
  }) {
    _message = message;
    _data = data;
  }

  AddFavoriteResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data =
        json['data'] != null ? AddFavoriteDto.fromJson(json['data']) : null;
  }
  String? _message;
  AddFavoriteDto? _data;
  AddFavoriteResponse copyWith({
    String? message,
    AddFavoriteDto? data,
  }) =>
      AddFavoriteResponse(
        message: message ?? _message,
        data: data ?? _data,
      );
  String? get message => _message;
  AddFavoriteDto? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
