class Meta {
  Meta({
      num? serverTime, 
      String? serverTimezone, 
      num? apiVersion, 
      String? executionTime,}){
    _serverTime = serverTime;
    _serverTimezone = serverTimezone;
    _apiVersion = apiVersion;
    _executionTime = executionTime;
}

  Meta.fromJson(dynamic json) {
    _serverTime = json['server_time'];
    _serverTimezone = json['server_timezone'];
    _apiVersion = json['api_version'];
    _executionTime = json['execution_time'];
  }
  num? _serverTime;
  String? _serverTimezone;
  num? _apiVersion;
  String? _executionTime;
  Meta copyWith({  num? serverTime,
  String? serverTimezone,
  num? apiVersion,
  String? executionTime,
}) => Meta(  serverTime: serverTime ?? _serverTime,
  serverTimezone: serverTimezone ?? _serverTimezone,
  apiVersion: apiVersion ?? _apiVersion,
  executionTime: executionTime ?? _executionTime,
);
  num? get serverTime => _serverTime;
  String? get serverTimezone => _serverTimezone;
  num? get apiVersion => _apiVersion;
  String? get executionTime => _executionTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['server_time'] = _serverTime;
    map['server_timezone'] = _serverTimezone;
    map['api_version'] = _apiVersion;
    map['execution_time'] = _executionTime;
    return map;
  }

}