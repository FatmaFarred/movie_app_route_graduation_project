import '../movie/movie_model.dart';

/// message : "favourites fetched successfully"
/// data : [{"movieId":"movieId","name":"test","rating":2.4,"imageURL":"https//imagelink","year":"2002"},{"movieId":"movieId1","name":"test","rating":2.4,"imageURL":"https//imagelink","year":"2002"}]

class FavoritesResponse {
  FavoritesResponse({
    String? message,
    List<MovieModel>? data,
  }) {
    _message = message;
    _data = data;
  }

  FavoritesResponse.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(MovieModel.fromJson(v));
      });
    }
  }
  String? _message;
  List<MovieModel>? _data;
  FavoritesResponse copyWith({
    String? message,
    List<MovieModel>? data,
  }) =>
      FavoritesResponse(
        message: message ?? _message,
        data: data ?? _data,
      );
  String? get message => _message;
  List<MovieModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
