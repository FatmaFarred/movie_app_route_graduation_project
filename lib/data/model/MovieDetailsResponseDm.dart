import 'package:movie_app_route_graduation_project/domain/entities/MovieDetailsResponseEntity.dart';

import 'movie/movie_model.dart';

/// status : "ok"
/// status_message : "Query was successful"
/// data : {"movie":{"id":15,"url":"https://yts.mx/movies/16-blocks-2006","imdb_code":"tt0450232","title":"16 Blocks","title_english":"16 Blocks","title_long":"16 Blocks (2006)","slug":"16-blocks-2006","year":2006,"rating":6.6,"runtime":102,"genres":["Action","Crime","Drama","Thriller"],"like_count":49,"description_intro":"\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294","description_full":"\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294","yt_trailer_code":"55nKvGV0APA","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/16_Blocks_2006/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/16_Blocks_2006/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/16_Blocks_2006/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/16_Blocks_2006/medium-cover.jpg","large_cover_image":"https://yts.mx/assets/images/movies/16_Blocks_2006/large-cover.jpg","medium_screenshot_image1":"https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.mx/assets/images/movies/16_Blocks_2006/large-screenshot1.jpg","large_screenshot_image2":"https://yts.mx/assets/images/movies/16_Blocks_2006/large-screenshot2.jpg","large_screenshot_image3":"https://yts.mx/assets/images/movies/16_Blocks_2006/large-screenshot3.jpg","cast":[{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"Tom Wlaschiha","character_name":"Bus Passenger","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0937239.jpg","imdb_code":"0937239"},{"name":"David Morse","character_name":"Det. Frank Nugent","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0001556.jpg","imdb_code":"0001556"},{"name":"Sasha Roiz","character_name":"Kaller","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm1501388.jpg","imdb_code":"1501388"}],"torrents":[{"url":"https://yts.mx/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2","hash":"8619B57A3F39F1B49A1A698EA5400A883928C0A2","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":2,"peers":0,"size":"702.04 MB","size_bytes":736142295,"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855},{"url":"https://yts.mx/torrent/download/2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","hash":"2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":37,"peers":3,"size":"1.40 GB","size_bytes":1503238554,"date_uploaded":"2015-10-31 20:47:38","date_uploaded_unix":1446320858}],"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855}}
/// @meta : {"server_time":1742501476,"server_timezone":"CET","api_version":2,"execution_time":"0 ms"}

class MovieDetailsResponseDm extends MovieDetailsResponseEntity{
  MovieDetailsResponseDm({
      super.status,
    super.statusMessage,
    super.data,
    super.meta,});

  MovieDetailsResponseDm.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? DataDm.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? metaDm.fromJson(json['@meta']) : null;
  }



}

/// server_time : 1742501476
/// server_timezone : "CET"
/// api_version : 2
/// execution_time : "0 ms"

class metaDm extends metaEntity{
  metaDm({
    super.serverTime,
    super.serverTimezone,
    super.apiVersion,
    super.executionTime,});

  metaDm.fromJson(dynamic json) {
    serverTime = json['server_time'];
    serverTimezone = json['server_timezone'];
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }



}

/// movie : {"id":15,"url":"https://yts.mx/movies/16-blocks-2006","imdb_code":"tt0450232","title":"16 Blocks","title_english":"16 Blocks","title_long":"16 Blocks (2006)","slug":"16-blocks-2006","year":2006,"rating":6.6,"runtime":102,"genres":["Action","Crime","Drama","Thriller"],"like_count":49,"description_intro":"\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294","description_full":"\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294","yt_trailer_code":"55nKvGV0APA","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/16_Blocks_2006/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/16_Blocks_2006/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/16_Blocks_2006/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/16_Blocks_2006/medium-cover.jpg","large_cover_image":"https://yts.mx/assets/images/movies/16_Blocks_2006/large-cover.jpg","medium_screenshot_image1":"https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.mx/assets/images/movies/16_Blocks_2006/large-screenshot1.jpg","large_screenshot_image2":"https://yts.mx/assets/images/movies/16_Blocks_2006/large-screenshot2.jpg","large_screenshot_image3":"https://yts.mx/assets/images/movies/16_Blocks_2006/large-screenshot3.jpg","cast":[{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"Tom Wlaschiha","character_name":"Bus Passenger","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0937239.jpg","imdb_code":"0937239"},{"name":"David Morse","character_name":"Det. Frank Nugent","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0001556.jpg","imdb_code":"0001556"},{"name":"Sasha Roiz","character_name":"Kaller","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm1501388.jpg","imdb_code":"1501388"}],"torrents":[{"url":"https://yts.mx/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2","hash":"8619B57A3F39F1B49A1A698EA5400A883928C0A2","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":2,"peers":0,"size":"702.04 MB","size_bytes":736142295,"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855},{"url":"https://yts.mx/torrent/download/2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","hash":"2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":37,"peers":3,"size":"1.40 GB","size_bytes":1503238554,"date_uploaded":"2015-10-31 20:47:38","date_uploaded_unix":1446320858}],"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855}

class DataDm extends DataEntity  {
  DataDm({
      super.movie,});

  DataDm.fromJson(dynamic json) {
    movie = json['movie'] != null ? MovieDm.fromJson(json['movie']) : null;
  }


}

/// id : 15
/// url : "https://yts.mx/movies/16-blocks-2006"
/// imdb_code : "tt0450232"
/// title : "16 Blocks"
/// title_english : "16 Blocks"
/// title_long : "16 Blocks (2006)"
/// slug : "16-blocks-2006"
/// year : 2006
/// rating : 6.6
/// runtime : 102
/// genres : ["Action","Crime","Drama","Thriller"]
/// like_count : 49
/// description_intro : "\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294"
/// description_full : "\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294"
/// yt_trailer_code : "55nKvGV0APA"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.mx/assets/images/movies/16_Blocks_2006/background.jpg"
/// background_image_original : "https://yts.mx/assets/images/movies/16_Blocks_2006/background.jpg"
/// small_cover_image : "https://yts.mx/assets/images/movies/16_Blocks_2006/small-cover.jpg"
/// medium_cover_image : "https://yts.mx/assets/images/movies/16_Blocks_2006/medium-cover.jpg"
/// large_cover_image : "https://yts.mx/assets/images/movies/16_Blocks_2006/large-cover.jpg"
/// medium_screenshot_image1 : "https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg"
/// medium_screenshot_image2 : "https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg"
/// medium_screenshot_image3 : "https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg"
/// large_screenshot_image1 : "https://yts.mx/assets/images/movies/16_Blocks_2006/large-screenshot1.jpg"
/// large_screenshot_image2 : "https://yts.mx/assets/images/movies/16_Blocks_2006/large-screenshot2.jpg"
/// large_screenshot_image3 : "https://yts.mx/assets/images/movies/16_Blocks_2006/large-screenshot3.jpg"
/// cast : [{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"Tom Wlaschiha","character_name":"Bus Passenger","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0937239.jpg","imdb_code":"0937239"},{"name":"David Morse","character_name":"Det. Frank Nugent","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0001556.jpg","imdb_code":"0001556"},{"name":"Sasha Roiz","character_name":"Kaller","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm1501388.jpg","imdb_code":"1501388"}]
/// torrents : [{"url":"https://yts.mx/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2","hash":"8619B57A3F39F1B49A1A698EA5400A883928C0A2","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":2,"peers":0,"size":"702.04 MB","size_bytes":736142295,"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855},{"url":"https://yts.mx/torrent/download/2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","hash":"2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":37,"peers":3,"size":"1.40 GB","size_bytes":1503238554,"date_uploaded":"2015-10-31 20:47:38","date_uploaded_unix":1446320858}]
/// date_uploaded : "2015-10-31 20:47:35"
/// date_uploaded_unix : 1446320855

class MovieDm extends  MovieEntity {
  MovieDm({
    super.id,
    super.url,
    super.imdbCode,
    super.title,
    super.titleEnglish,
    super.titleLong,
    super.slug,
    super.year,
    super.rating,
    super.runtime,
    super.genres,
    super.likeCount,
    super.descriptionIntro,
    super.descriptionFull,
    super.ytTrailerCode,
    super.language,
    super.mpaRating,
    super.backgroundImage,
    super.backgroundImageOriginal,
    super.smallCoverImage,
    super.mediumCoverImage,
    super.largeCoverImage,
    super.mediumScreenshotImage1,
    super.mediumScreenshotImage2,
    super.mediumScreenshotImage3,
    super.largeScreenshotImage1,
    super.largeScreenshotImage2,
    super.largeScreenshotImage3,
    super.cast,
    super.torrents,
    super.dateUploaded,
    super.dateUploadedUnix,});

  MovieDm.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = json['rating'];
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    likeCount = json['like_count'];
    descriptionIntro = json['description_intro'];
    descriptionFull = json['description_full'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    mediumScreenshotImage1 = json['medium_screenshot_image1'];
    mediumScreenshotImage2 = json['medium_screenshot_image2'];
    mediumScreenshotImage3 = json['medium_screenshot_image3'];
    largeScreenshotImage1 = json['large_screenshot_image1'];
    largeScreenshotImage2 = json['large_screenshot_image2'];
    largeScreenshotImage3 = json['large_screenshot_image3'];
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(CastDm.fromJson(v));
      });
    }
    if (json['torrents'] != null) {
      torrents = [];
      json['torrents'].forEach((v) {
        torrents?.add(TorrentsDm.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }

  MovieModel toMovieModel(){
    return MovieModel(movieId: "$id", name: title, rating: rating?.toDouble(), imageURL: mediumCoverImage, year: "$year");
  }

}

/// url : "https://yts.mx/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2"
/// hash : "8619B57A3F39F1B49A1A698EA5400A883928C0A2"
/// quality : "720p"
/// type : "bluray"
/// is_repack : "0"
/// video_codec : "x264"
/// bit_depth : "8"
/// audio_channels : "2.0"
/// seeds : 2
/// peers : 0
/// size : "702.04 MB"
/// size_bytes : 736142295
/// date_uploaded : "2015-10-31 20:47:35"
/// date_uploaded_unix : 1446320855

class TorrentsDm extends TorrentsEntity {
  TorrentsDm({
      super.url,
    super.hash,
    super.quality,
    super.type,
    super.isRepack,
    super.videoCodec,
    super.bitDepth,
    super.audioChannels,
    super.seeds,
    super.peers,
    super.size,
    super.sizeBytes,
    super.dateUploaded,
    super.dateUploadedUnix,});

  TorrentsDm.fromJson(dynamic json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    type = json['type'];
    isRepack = json['is_repack'];
    videoCodec = json['video_codec'];
    bitDepth = json['bit_depth'];
    audioChannels = json['audio_channels'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }


}

/// name : "Bruce Willis"
/// character_name : "Det. Jack Mosley"
/// url_small_image : "https://yts.mx/assets/images/actors/thumb/nm0000246.jpg"
/// imdb_code : "0000246"

class CastDm extends CastEntity {
  CastDm({
    super.name,
    super.characterName,
    super.urlSmallImage,
    super.imdbCode,});

  CastDm.fromJson(dynamic json) {
    name = json['name'];
    characterName = json['character_name'];
    urlSmallImage = json['url_small_image'];
    imdbCode = json['imdb_code'];
  }




}