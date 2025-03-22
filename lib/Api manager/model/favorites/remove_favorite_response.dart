import 'package:movie_app_route_graduation_project/domain/entities/remove_favorite.dart';

/// message : "Removed from favourite successfully"

class RemoveFavoriteResponse {
  RemoveFavoriteResponse({
      String? message,}){
    _message = message;
}

  RemoveFavoriteResponse.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
  RemoveFavoriteResponse copyWith({  String? message,
}) => RemoveFavoriteResponse(  message: message ?? _message,
);
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

  RemoveFavorite toRemoveFavorite() {
    return RemoveFavorite(message: message);
  }

}