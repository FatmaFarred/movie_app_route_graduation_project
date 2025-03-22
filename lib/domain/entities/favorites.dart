class Favorites {
  Favorites({
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

  String? _movieId;
  String? _name;
  double? _rating;
  String? _imageURL;
  String? _year;

  String? get movieId => _movieId;
  String? get name => _name;
  double? get rating => _rating;
  String? get imageURL => _imageURL;
  String? get year => _year;
}
