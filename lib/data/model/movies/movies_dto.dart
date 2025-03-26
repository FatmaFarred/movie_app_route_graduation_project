import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';

import 'torrents.dart';

class MoviesDTO {
  MoviesDTO({
    num? id,
    String? url,
    String? imdbCode,
    String? title,
    String? titleEnglish,
    String? titleLong,
    String? slug,
    num? year,
    num? rating,
    num? runtime,
    List<String>? genres,
    String? summary,
    String? descriptionFull,
    String? synopsis,
    String? ytTrailerCode,
    String? language,
    String? mpaRating,
    String? backgroundImage,
    String? backgroundImageOriginal,
    String? smallCoverImage,
    String? mediumCoverImage,
    String? largeCoverImage,
    String? state,
    List<Torrents>? torrents,
    String? dateUploaded,
    num? dateUploadedUnix,
  }) {
    _id = id;
    _url = url;
    _imdbCode = imdbCode;
    _title = title;
    _titleEnglish = titleEnglish;
    _titleLong = titleLong;
    _slug = slug;
    _year = year;
    _rating = rating;
    _runtime = runtime;
    _genres = genres;
    _summary = summary;
    _descriptionFull = descriptionFull;
    _synopsis = synopsis;
    _ytTrailerCode = ytTrailerCode;
    _language = language;
    _mpaRating = mpaRating;
    _backgroundImage = backgroundImage;
    _backgroundImageOriginal = backgroundImageOriginal;
    _smallCoverImage = smallCoverImage;
    _mediumCoverImage = mediumCoverImage;
    _largeCoverImage = largeCoverImage;
    _state = state;
    _torrents = torrents;
    _dateUploaded = dateUploaded;
    _dateUploadedUnix = dateUploadedUnix;
  }

  MoviesDTO.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
    _imdbCode = json['imdb_code'];
    _title = json['title'];
    _titleEnglish = json['title_english'];
    _titleLong = json['title_long'];
    _slug = json['slug'];
    _year = json['year'];
    _rating = json['rating'];
    _runtime = json['runtime'];
    _genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    _summary = json['summary'];
    _descriptionFull = json['description_full'];
    _synopsis = json['synopsis'];
    _ytTrailerCode = json['yt_trailer_code'];
    _language = json['language'];
    _mpaRating = json['mpa_rating'];
    _backgroundImage = json['background_image'];
    _backgroundImageOriginal = json['background_image_original'];
    _smallCoverImage = json['small_cover_image'];
    _mediumCoverImage = json['medium_cover_image'];
    _largeCoverImage = json['large_cover_image'];
    _state = json['state'];
    if (json['torrents'] != null) {
      _torrents = [];
      json['torrents'].forEach((v) {
        _torrents?.add(Torrents.fromJson(v));
      });
    }
    _dateUploaded = json['date_uploaded'];
    _dateUploadedUnix = json['date_uploaded_unix'];
  }
  num? _id;
  String? _url;
  String? _imdbCode;
  String? _title;
  String? _titleEnglish;
  String? _titleLong;
  String? _slug;
  num? _year;
  num? _rating;
  num? _runtime;
  List<String>? _genres;
  String? _summary;
  String? _descriptionFull;
  String? _synopsis;
  String? _ytTrailerCode;
  String? _language;
  String? _mpaRating;
  String? _backgroundImage;
  String? _backgroundImageOriginal;
  String? _smallCoverImage;
  String? _mediumCoverImage;
  String? _largeCoverImage;
  String? _state;
  List<Torrents>? _torrents;
  String? _dateUploaded;
  num? _dateUploadedUnix;
  MoviesDTO copyWith({
    num? id,
    String? url,
    String? imdbCode,
    String? title,
    String? titleEnglish,
    String? titleLong,
    String? slug,
    num? year,
    num? rating,
    num? runtime,
    List<String>? genres,
    String? summary,
    String? descriptionFull,
    String? synopsis,
    String? ytTrailerCode,
    String? language,
    String? mpaRating,
    String? backgroundImage,
    String? backgroundImageOriginal,
    String? smallCoverImage,
    String? mediumCoverImage,
    String? largeCoverImage,
    String? state,
    List<Torrents>? torrents,
    String? dateUploaded,
    num? dateUploadedUnix,
  }) =>
      MoviesDTO(
        id: id ?? _id,
        url: url ?? _url,
        imdbCode: imdbCode ?? _imdbCode,
        title: title ?? _title,
        titleEnglish: titleEnglish ?? _titleEnglish,
        titleLong: titleLong ?? _titleLong,
        slug: slug ?? _slug,
        year: year ?? _year,
        rating: rating ?? _rating,
        runtime: runtime ?? _runtime,
        genres: genres ?? _genres,
        summary: summary ?? _summary,
        descriptionFull: descriptionFull ?? _descriptionFull,
        synopsis: synopsis ?? _synopsis,
        ytTrailerCode: ytTrailerCode ?? _ytTrailerCode,
        language: language ?? _language,
        mpaRating: mpaRating ?? _mpaRating,
        backgroundImage: backgroundImage ?? _backgroundImage,
        backgroundImageOriginal:
            backgroundImageOriginal ?? _backgroundImageOriginal,
        smallCoverImage: smallCoverImage ?? _smallCoverImage,
        mediumCoverImage: mediumCoverImage ?? _mediumCoverImage,
        largeCoverImage: largeCoverImage ?? _largeCoverImage,
        state: state ?? _state,
        torrents: torrents ?? _torrents,
        dateUploaded: dateUploaded ?? _dateUploaded,
        dateUploadedUnix: dateUploadedUnix ?? _dateUploadedUnix,
      );
  num? get id => _id;
  String? get url => _url;
  String? get imdbCode => _imdbCode;
  String? get title => _title;
  String? get titleEnglish => _titleEnglish;
  String? get titleLong => _titleLong;
  String? get slug => _slug;
  num? get year => _year;
  num? get rating => _rating;
  num? get runtime => _runtime;
  List<String>? get genres => _genres;
  String? get summary => _summary;
  String? get descriptionFull => _descriptionFull;
  String? get synopsis => _synopsis;
  String? get ytTrailerCode => _ytTrailerCode;
  String? get language => _language;
  String? get mpaRating => _mpaRating;
  String? get backgroundImage => _backgroundImage;
  String? get backgroundImageOriginal => _backgroundImageOriginal;
  String? get smallCoverImage => _smallCoverImage;
  String? get mediumCoverImage => _mediumCoverImage;
  String? get largeCoverImage => _largeCoverImage;
  String? get state => _state;
  List<Torrents>? get torrents => _torrents;
  String? get dateUploaded => _dateUploaded;
  num? get dateUploadedUnix => _dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    map['imdb_code'] = _imdbCode;
    map['title'] = _title;
    map['title_english'] = _titleEnglish;
    map['title_long'] = _titleLong;
    map['slug'] = _slug;
    map['year'] = _year;
    map['rating'] = _rating;
    map['runtime'] = _runtime;
    map['genres'] = _genres;
    map['summary'] = _summary;
    map['description_full'] = _descriptionFull;
    map['synopsis'] = _synopsis;
    map['yt_trailer_code'] = _ytTrailerCode;
    map['language'] = _language;
    map['mpa_rating'] = _mpaRating;
    map['background_image'] = _backgroundImage;
    map['background_image_original'] = _backgroundImageOriginal;
    map['small_cover_image'] = _smallCoverImage;
    map['medium_cover_image'] = _mediumCoverImage;
    map['large_cover_image'] = _largeCoverImage;
    map['state'] = _state;
    if (_torrents != null) {
      map['torrents'] = _torrents?.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = _dateUploaded;
    map['date_uploaded_unix'] = _dateUploadedUnix;
    return map;
  }

  MovieModel toMovieModel() {
    return MovieModel(
        movieId: "$id",
        name: title,
        rating: rating?.toDouble(),
        imageURL: mediumCoverImage,
        year: "$year");
  }
}
