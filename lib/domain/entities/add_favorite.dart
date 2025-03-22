class AddFavorite {
  AddFavorite({
    String? movieId,
    String? name,
    num? rating,
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
  num? _rating;
  String? _imageURL;
  String? _year;

  String? get movieId => _movieId;
  String? get name => _name;
  num? get rating => _rating;
  String? get imageURL => _imageURL;
  String? get year => _year;
}
