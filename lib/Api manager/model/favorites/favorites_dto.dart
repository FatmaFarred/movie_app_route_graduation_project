import 'package:movie_app_route_graduation_project/domain/entities/favorites.dart';

class FavoritesDto {
  FavoritesDto({
    String? movieId,
    String? name,
    double? rating,
    String? imageURL,
    String? year,
  }) {
    _movieId = movieId;
    _name = name;
    _rating = rating;
    _imageURL = imageURL;
    _year = year;
  }

  FavoritesDto.fromJson(dynamic json) {
    _movieId = json['movieId'];
    _name = json['name'];
    _rating = json['rating'];
    _imageURL = json['imageURL'];
    _year = json['year'];
  }
  String? _movieId;
  String? _name;
  double? _rating;
  String? _imageURL;
  String? _year;
  FavoritesDto copyWith({
    String? movieId,
    String? name,
    double? rating,
    String? imageURL,
    String? year,
  }) =>
      FavoritesDto(
        movieId: movieId ?? _movieId,
        name: name ?? _name,
        rating: rating ?? _rating,
        imageURL: imageURL ?? _imageURL,
        year: year ?? _year,
      );
  String? get movieId => _movieId;
  String? get name => _name;
  double? get rating => _rating;
  String? get imageURL => _imageURL;
  String? get year => _year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movieId'] = _movieId;
    map['name'] = _name;
    map['rating'] = _rating;
    map['imageURL'] = _imageURL;
    map['year'] = _year;
    return map;
  }

  Favorites toFavorites(){
    return Favorites(
      movieId: movieId,
      name: name,
      rating: rating,
      imageURL: imageURL,
      year: year
    );
  }
}
