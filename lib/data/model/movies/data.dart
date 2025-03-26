import 'movies_dto.dart';

class Data {
  Data({
      num? movieCount, 
      num? limit, 
      num? pageNumber, 
      List<MoviesDTO>? movies,}){
    _movieCount = movieCount;
    _limit = limit;
    _pageNumber = pageNumber;
    _movies = movies;
}

  Data.fromJson(dynamic json) {
    _movieCount = json['movie_count'];
    _limit = json['limit'];
    _pageNumber = json['page_number'];
    if (json['movies'] != null) {
      _movies = [];
      json['movies'].forEach((v) {
        _movies?.add(MoviesDTO.fromJson(v));
      });
    }
  }
  num? _movieCount;
  num? _limit;
  num? _pageNumber;
  List<MoviesDTO>? _movies;
Data copyWith({  num? movieCount,
  num? limit,
  num? pageNumber,
  List<MoviesDTO>? movies,
}) => Data(  movieCount: movieCount ?? _movieCount,
  limit: limit ?? _limit,
  pageNumber: pageNumber ?? _pageNumber,
  movies: movies ?? _movies,
);
  num? get movieCount => _movieCount;
  num? get limit => _limit;
  num? get pageNumber => _pageNumber;
  List<MoviesDTO>? get movies => _movies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movie_count'] = _movieCount;
    map['limit'] = _limit;
    map['page_number'] = _pageNumber;
    if (_movies != null) {
      map['movies'] = _movies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}