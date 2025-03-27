import '../../data/model/movie/movie_model.dart';

/// status : "ok"
/// status_message : "Query was successful"
/// data : {"movie":{"id":10,"url":"https://yts.mx/movies/13-2010","imdb_code":"tt0798817","title":"13","title_english":"13","title_long":"13 (2010)","slug":"13-2010","year":2010,"rating":6,"runtime":91,"genres":["Action","Crime","Drama","Thriller"],"like_count":73,"description_intro":"In Talbot, Ohio, a father's need for surgeries puts the family in a financial bind. His son Vince, an electrician, overhears a man talking about making a fortune in just a day. When the man overdoses on drugs, Vince finds instructions and a cell phone that the man has received and substitutes himself: taking a train to New York and awaiting contact. He has no idea what it's about. He ends up at a remote house where wealthy men bet on who will survive a complicated game of Russian roulette: he's number 13. In flashbacks we meet other contestants, including a man whose brother takes him out of a mental institution in order to compete. Can Vince be the last one standing?—","description_full":"In Talbot, Ohio, a father's need for surgeries puts the family in a financial bind. His son Vince, an electrician, overhears a man talking about making a fortune in just a day. When the man overdoses on drugs, Vince finds instructions and a cell phone that the man has received and substitutes himself: taking a train to New York and awaiting contact. He has no idea what it's about. He ends up at a remote house where wealthy men bet on who will survive a complicated game of Russian roulette: he's number 13. In flashbacks we meet other contestants, including a man whose brother takes him out of a mental institution in order to compete. Can Vince be the last one standing?—","yt_trailer_code":"Y41fFj-P4jI","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/13_2010/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/13_2010/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/13_2010/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/13_2010/medium-cover.jpg","large_cover_image":"https://yts.mx/assets/images/movies/13_2010/large-cover.jpg","medium_screenshot_image1":"https://yts.mx/assets/images/movies/13_2010/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.mx/assets/images/movies/13_2010/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.mx/assets/images/movies/13_2010/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.mx/assets/images/movies/13_2010/large-screenshot1.jpg","large_screenshot_image2":"https://yts.mx/assets/images/movies/13_2010/large-screenshot2.jpg","large_screenshot_image3":"https://yts.mx/assets/images/movies/13_2010/large-screenshot3.jpg","cast":[{"name":"Alexander Skarsgård","character_name":"Jack","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0002907.jpg","imdb_code":"0002907"},{"name":"Jason Statham","character_name":"Jasper","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0005458.jpg","imdb_code":"0005458"},{"name":"Michael Shannon","character_name":"Henry","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0788335.jpg","imdb_code":"0788335"},{"name":"Emmanuelle Chriqui","character_name":"Aileen","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0004825.jpg","imdb_code":"0004825"}],"torrents":[{"url":"https://yts.mx/torrent/download/BE046ED20B048C4FB86E15838DD69DADB27C5E8A","hash":"BE046ED20B048C4FB86E15838DD69DADB27C5E8A","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":9,"peers":1,"size":"946.49 MB","size_bytes":992466698,"date_uploaded":"2015-10-31 20:46:37","date_uploaded_unix":1446320797},{"url":"https://yts.mx/torrent/download/FEE33A702158CD451220BD4F23FC46AD7BC65C4D","hash":"FEE33A702158CD451220BD4F23FC46AD7BC65C4D","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"5.1","seeds":16,"peers":4,"size":"1.79 GB","size_bytes":1921997865,"date_uploaded":"2022-01-19 00:57:56","date_uploaded_unix":1642550276}],"date_uploaded":"2015-10-31 20:46:37","date_uploaded_unix":1446320797}}
/// @meta : {"server_time":1742500156,"server_timezone":"CET","api_version":2,"execution_time":"0 ms"}

class MovieDetailsResponseEntity {
  MovieDetailsResponseEntity({
    this.status,
    this.statusMessage,
    this.data,
    this.meta,});


  String? status;
  String? statusMessage;
  DataEntity? data;
  metaEntity? meta;

}
class metaEntity {
  metaEntity({
      this.serverTime, 
      this.serverTimezone, 
      this.apiVersion, 
      this.executionTime,});


  num? serverTime;
  String? serverTimezone;
  num? apiVersion;
  String? executionTime;



}

/// movie : {"id":10,"url":"https://yts.mx/movies/13-2010","imdb_code":"tt0798817","title":"13","title_english":"13","title_long":"13 (2010)","slug":"13-2010","year":2010,"rating":6,"runtime":91,"genres":["Action","Crime","Drama","Thriller"],"like_count":73,"description_intro":"In Talbot, Ohio, a father's need for surgeries puts the family in a financial bind. His son Vince, an electrician, overhears a man talking about making a fortune in just a day. When the man overdoses on drugs, Vince finds instructions and a cell phone that the man has received and substitutes himself: taking a train to New York and awaiting contact. He has no idea what it's about. He ends up at a remote house where wealthy men bet on who will survive a complicated game of Russian roulette: he's number 13. In flashbacks we meet other contestants, including a man whose brother takes him out of a mental institution in order to compete. Can Vince be the last one standing?—","description_full":"In Talbot, Ohio, a father's need for surgeries puts the family in a financial bind. His son Vince, an electrician, overhears a man talking about making a fortune in just a day. When the man overdoses on drugs, Vince finds instructions and a cell phone that the man has received and substitutes himself: taking a train to New York and awaiting contact. He has no idea what it's about. He ends up at a remote house where wealthy men bet on who will survive a complicated game of Russian roulette: he's number 13. In flashbacks we meet other contestants, including a man whose brother takes him out of a mental institution in order to compete. Can Vince be the last one standing?—","yt_trailer_code":"Y41fFj-P4jI","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/13_2010/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/13_2010/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/13_2010/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/13_2010/medium-cover.jpg","large_cover_image":"https://yts.mx/assets/images/movies/13_2010/large-cover.jpg","medium_screenshot_image1":"https://yts.mx/assets/images/movies/13_2010/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.mx/assets/images/movies/13_2010/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.mx/assets/images/movies/13_2010/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.mx/assets/images/movies/13_2010/large-screenshot1.jpg","large_screenshot_image2":"https://yts.mx/assets/images/movies/13_2010/large-screenshot2.jpg","large_screenshot_image3":"https://yts.mx/assets/images/movies/13_2010/large-screenshot3.jpg","cast":[{"name":"Alexander Skarsgård","character_name":"Jack","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0002907.jpg","imdb_code":"0002907"},{"name":"Jason Statham","character_name":"Jasper","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0005458.jpg","imdb_code":"0005458"},{"name":"Michael Shannon","character_name":"Henry","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0788335.jpg","imdb_code":"0788335"},{"name":"Emmanuelle Chriqui","character_name":"Aileen","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0004825.jpg","imdb_code":"0004825"}],"torrents":[{"url":"https://yts.mx/torrent/download/BE046ED20B048C4FB86E15838DD69DADB27C5E8A","hash":"BE046ED20B048C4FB86E15838DD69DADB27C5E8A","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":9,"peers":1,"size":"946.49 MB","size_bytes":992466698,"date_uploaded":"2015-10-31 20:46:37","date_uploaded_unix":1446320797},{"url":"https://yts.mx/torrent/download/FEE33A702158CD451220BD4F23FC46AD7BC65C4D","hash":"FEE33A702158CD451220BD4F23FC46AD7BC65C4D","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"5.1","seeds":16,"peers":4,"size":"1.79 GB","size_bytes":1921997865,"date_uploaded":"2022-01-19 00:57:56","date_uploaded_unix":1642550276}],"date_uploaded":"2015-10-31 20:46:37","date_uploaded_unix":1446320797}

class DataEntity {
  DataEntity({
        this.movie,});


  MovieEntity? movie;



}

/// id : 10
/// url : "https://yts.mx/movies/13-2010"
/// imdb_code : "tt0798817"
/// title : "13"
/// title_english : "13"
/// title_long : "13 (2010)"
/// slug : "13-2010"
/// year : 2010
/// rating : 6
/// runtime : 91
/// genres : ["Action","Crime","Drama","Thriller"]
/// like_count : 73
/// description_intro : "In Talbot, Ohio, a father's need for surgeries puts the family in a financial bind. His son Vince, an electrician, overhears a man talking about making a fortune in just a day. When the man overdoses on drugs, Vince finds instructions and a cell phone that the man has received and substitutes himself: taking a train to New York and awaiting contact. He has no idea what it's about. He ends up at a remote house where wealthy men bet on who will survive a complicated game of Russian roulette: he's number 13. In flashbacks we meet other contestants, including a man whose brother takes him out of a mental institution in order to compete. Can Vince be the last one standing?—"
/// description_full : "In Talbot, Ohio, a father's need for surgeries puts the family in a financial bind. His son Vince, an electrician, overhears a man talking about making a fortune in just a day. When the man overdoses on drugs, Vince finds instructions and a cell phone that the man has received and substitutes himself: taking a train to New York and awaiting contact. He has no idea what it's about. He ends up at a remote house where wealthy men bet on who will survive a complicated game of Russian roulette: he's number 13. In flashbacks we meet other contestants, including a man whose brother takes him out of a mental institution in order to compete. Can Vince be the last one standing?—"
/// yt_trailer_code : "Y41fFj-P4jI"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.mx/assets/images/movies/13_2010/background.jpg"
/// background_image_original : "https://yts.mx/assets/images/movies/13_2010/background.jpg"
/// small_cover_image : "https://yts.mx/assets/images/movies/13_2010/small-cover.jpg"
/// medium_cover_image : "https://yts.mx/assets/images/movies/13_2010/medium-cover.jpg"
/// large_cover_image : "https://yts.mx/assets/images/movies/13_2010/large-cover.jpg"
/// medium_screenshot_image1 : "https://yts.mx/assets/images/movies/13_2010/medium-screenshot1.jpg"
/// medium_screenshot_image2 : "https://yts.mx/assets/images/movies/13_2010/medium-screenshot2.jpg"
/// medium_screenshot_image3 : "https://yts.mx/assets/images/movies/13_2010/medium-screenshot3.jpg"
/// large_screenshot_image1 : "https://yts.mx/assets/images/movies/13_2010/large-screenshot1.jpg"
/// large_screenshot_image2 : "https://yts.mx/assets/images/movies/13_2010/large-screenshot2.jpg"
/// large_screenshot_image3 : "https://yts.mx/assets/images/movies/13_2010/large-screenshot3.jpg"
/// cast : [{"name":"Alexander Skarsgård","character_name":"Jack","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0002907.jpg","imdb_code":"0002907"},{"name":"Jason Statham","character_name":"Jasper","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0005458.jpg","imdb_code":"0005458"},{"name":"Michael Shannon","character_name":"Henry","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0788335.jpg","imdb_code":"0788335"},{"name":"Emmanuelle Chriqui","character_name":"Aileen","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0004825.jpg","imdb_code":"0004825"}]
/// torrents : [{"url":"https://yts.mx/torrent/download/BE046ED20B048C4FB86E15838DD69DADB27C5E8A","hash":"BE046ED20B048C4FB86E15838DD69DADB27C5E8A","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":9,"peers":1,"size":"946.49 MB","size_bytes":992466698,"date_uploaded":"2015-10-31 20:46:37","date_uploaded_unix":1446320797},{"url":"https://yts.mx/torrent/download/FEE33A702158CD451220BD4F23FC46AD7BC65C4D","hash":"FEE33A702158CD451220BD4F23FC46AD7BC65C4D","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"5.1","seeds":16,"peers":4,"size":"1.79 GB","size_bytes":1921997865,"date_uploaded":"2022-01-19 00:57:56","date_uploaded_unix":1642550276}]
/// date_uploaded : "2015-10-31 20:46:37"
/// date_uploaded_unix : 1446320797

class MovieEntity {
  MovieEntity({
      this.id, 
      this.url, 
      this.imdbCode, 
      this.title, 
      this.titleEnglish, 
      this.titleLong, 
      this.slug, 
      this.year, 
      this.rating, 
      this.runtime, 
      this.genres, 
      this.likeCount, 
      this.descriptionIntro, 
      this.descriptionFull, 
      this.ytTrailerCode, 
      this.language, 
      this.mpaRating, 
      this.backgroundImage, 
      this.backgroundImageOriginal, 
      this.smallCoverImage, 
      this.mediumCoverImage, 
      this.largeCoverImage, 
      this.mediumScreenshotImage1, 
      this.mediumScreenshotImage2, 
      this.mediumScreenshotImage3, 
      this.largeScreenshotImage1, 
      this.largeScreenshotImage2, 
      this.largeScreenshotImage3, 
      this.cast, 
      this.torrents, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  num? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  num? year;
  num? rating;
  num? runtime;
  List<String>? genres;
  num? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? mediumScreenshotImage1;
  String? mediumScreenshotImage2;
  String? mediumScreenshotImage3;
  String? largeScreenshotImage1;
  String? largeScreenshotImage2;
  String? largeScreenshotImage3;
  List<CastEntity>? cast;
  List<TorrentsEntity>? torrents;
  String? dateUploaded;
  num? dateUploadedUnix;

  MovieModel toMovieModel() {
    return MovieModel(
        movieId: id?.toInt(),
        name: title,
        rating: rating?.toDouble(),
        imageURL: mediumCoverImage,
        year: "$year"
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'imdb_code': imdbCode,
      'title': title,
      'title_english': titleEnglish,
      'title_long': titleLong,
      'slug': slug,
      'year': year,
      'rating': rating,
      'runtime': runtime,
      'genres': genres,
      'like_count': likeCount,
      'description_intro': descriptionIntro,
      'description_full': descriptionFull,
      'yt_trailer_code': ytTrailerCode,
      'language': language,
      'mpa_rating': mpaRating,
      'background_image': backgroundImage,
      'background_image_original': backgroundImageOriginal,
      'small_cover_image': smallCoverImage,
      'medium_cover_image': mediumCoverImage,
      'large_cover_image': largeCoverImage,
      'medium_screenshot_image1': mediumScreenshotImage1,
      'medium_screenshot_image2': mediumScreenshotImage2,
      'medium_screenshot_image3': mediumScreenshotImage3,
      'large_screenshot_image1': largeScreenshotImage1,
      'large_screenshot_image2': largeScreenshotImage2,
      'large_screenshot_image3': largeScreenshotImage3,
      'date_uploaded': dateUploaded,
      'date_uploaded_unix': dateUploadedUnix,
    };
  }



}

/// url : "https://yts.mx/torrent/download/BE046ED20B048C4FB86E15838DD69DADB27C5E8A"
/// hash : "BE046ED20B048C4FB86E15838DD69DADB27C5E8A"
/// quality : "720p"
/// type : "bluray"
/// is_repack : "0"
/// video_codec : "x264"
/// bit_depth : "8"
/// audio_channels : "2.0"
/// seeds : 9
/// peers : 1
/// size : "946.49 MB"
/// size_bytes : 992466698
/// date_uploaded : "2015-10-31 20:46:37"
/// date_uploaded_unix : 1446320797

class TorrentsEntity {
  TorrentsEntity({
      this.url, 
      this.hash, 
      this.quality, 
      this.type, 
      this.isRepack, 
      this.videoCodec, 
      this.bitDepth, 
      this.audioChannels, 
      this.seeds, 
      this.peers, 
      this.size, 
      this.sizeBytes, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  String? url;
  String? hash;
  String? quality;
  String? type;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  num? seeds;
  num? peers;
  String? size;
  num? sizeBytes;
  String? dateUploaded;
  num? dateUploadedUnix;


}

/// name : "Alexander Skarsgård"
/// character_name : "Jack"
/// url_small_image : "https://yts.mx/assets/images/actors/thumb/nm0002907.jpg"
/// imdb_code : "0002907"

class CastEntity {
  CastEntity({
      this.name, 
      this.characterName, 
      this.urlSmallImage, 
      this.imdbCode,});

  String? name;
  String? characterName;
  String? urlSmallImage;
  String? imdbCode;


}