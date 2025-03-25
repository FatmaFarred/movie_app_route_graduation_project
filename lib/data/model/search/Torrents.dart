class Torrents {
  Torrents({
      String? url, 
      String? hash, 
      String? quality, 
      String? type, 
      String? isRepack, 
      String? videoCodec, 
      String? bitDepth, 
      String? audioChannels, 
      num? seeds, 
      num? peers, 
      String? size, 
      num? sizeBytes, 
      String? dateUploaded, 
      num? dateUploadedUnix,}){
    _url = url;
    _hash = hash;
    _quality = quality;
    _type = type;
    _isRepack = isRepack;
    _videoCodec = videoCodec;
    _bitDepth = bitDepth;
    _audioChannels = audioChannels;
    _seeds = seeds;
    _peers = peers;
    _size = size;
    _sizeBytes = sizeBytes;
    _dateUploaded = dateUploaded;
    _dateUploadedUnix = dateUploadedUnix;
}

  Torrents.fromJson(dynamic json) {
    _url = json['url'];
    _hash = json['hash'];
    _quality = json['quality'];
    _type = json['type'];
    _isRepack = json['is_repack'];
    _videoCodec = json['video_codec'];
    _bitDepth = json['bit_depth'];
    _audioChannels = json['audio_channels'];
    _seeds = json['seeds'];
    _peers = json['peers'];
    _size = json['size'];
    _sizeBytes = json['size_bytes'];
    _dateUploaded = json['date_uploaded'];
    _dateUploadedUnix = json['date_uploaded_unix'];
  }
  String? _url;
  String? _hash;
  String? _quality;
  String? _type;
  String? _isRepack;
  String? _videoCodec;
  String? _bitDepth;
  String? _audioChannels;
  num? _seeds;
  num? _peers;
  String? _size;
  num? _sizeBytes;
  String? _dateUploaded;
  num? _dateUploadedUnix;
Torrents copyWith({  String? url,
  String? hash,
  String? quality,
  String? type,
  String? isRepack,
  String? videoCodec,
  String? bitDepth,
  String? audioChannels,
  num? seeds,
  num? peers,
  String? size,
  num? sizeBytes,
  String? dateUploaded,
  num? dateUploadedUnix,
}) => Torrents(  url: url ?? _url,
  hash: hash ?? _hash,
  quality: quality ?? _quality,
  type: type ?? _type,
  isRepack: isRepack ?? _isRepack,
  videoCodec: videoCodec ?? _videoCodec,
  bitDepth: bitDepth ?? _bitDepth,
  audioChannels: audioChannels ?? _audioChannels,
  seeds: seeds ?? _seeds,
  peers: peers ?? _peers,
  size: size ?? _size,
  sizeBytes: sizeBytes ?? _sizeBytes,
  dateUploaded: dateUploaded ?? _dateUploaded,
  dateUploadedUnix: dateUploadedUnix ?? _dateUploadedUnix,
);
  String? get url => _url;
  String? get hash => _hash;
  String? get quality => _quality;
  String? get type => _type;
  String? get isRepack => _isRepack;
  String? get videoCodec => _videoCodec;
  String? get bitDepth => _bitDepth;
  String? get audioChannels => _audioChannels;
  num? get seeds => _seeds;
  num? get peers => _peers;
  String? get size => _size;
  num? get sizeBytes => _sizeBytes;
  String? get dateUploaded => _dateUploaded;
  num? get dateUploadedUnix => _dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['hash'] = _hash;
    map['quality'] = _quality;
    map['type'] = _type;
    map['is_repack'] = _isRepack;
    map['video_codec'] = _videoCodec;
    map['bit_depth'] = _bitDepth;
    map['audio_channels'] = _audioChannels;
    map['seeds'] = _seeds;
    map['peers'] = _peers;
    map['size'] = _size;
    map['size_bytes'] = _sizeBytes;
    map['date_uploaded'] = _dateUploaded;
    map['date_uploaded_unix'] = _dateUploadedUnix;
    return map;
  }

}