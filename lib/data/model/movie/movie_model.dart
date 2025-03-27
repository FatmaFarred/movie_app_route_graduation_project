class MovieModel {
  MovieModel({
    int? movieId,
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

  MovieModel.fromJson(dynamic json) {
    _movieId = json['movieId'] is String ? int.tryParse(json['movieId']) : json['movieId'];
    _name = json['name'];
    _rating = json['rating'];
    _imageURL = json['imageURL'];
    _year = json['year'];
  }

  int? _movieId;
  String? _name;
  double? _rating;
  String? _imageURL;
  String? _year;

  MovieModel copyWith({
    int? movieId,
    String? name,
    double? rating,
    String? imageURL,
    String? year,
  }) =>
      MovieModel(
        movieId: movieId ?? _movieId,
        name: name ?? _name,
        rating: rating ?? _rating,
        imageURL: imageURL ?? _imageURL,
        year: year ?? _year,
      );

  int? get movieId => _movieId;
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
}
