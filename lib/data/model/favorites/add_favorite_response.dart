import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';

/// message : "Added to favourite successfully"
/// data : {"movieId":"movieId1","name":"test","rating":2.4,"imageURL":"https//imagelink","year":"2002"}

class AddFavoriteResponse {
  AddFavoriteResponse({
    String? message,
    MovieModel? data,
  }) {
    _message = message;
    _data = data;
  }

  AddFavoriteResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data =
        json['data'] != null ? MovieModel.fromJson(json['data']) : null;
  }
  String? _message;
  MovieModel? _data;
  AddFavoriteResponse copyWith({
    String? message,
    MovieModel? data,
  }) =>
      AddFavoriteResponse(
        message: message ?? _message,
        data: data ?? _data,
      );
  String? get message => _message;
  MovieModel? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
