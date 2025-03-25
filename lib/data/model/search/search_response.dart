import 'Data.dart';
import 'Meta.dart';

class SearchResponse {
  SearchResponse({
    String? status,
    String? statusMessage,
    Data? data,
    Meta? meta,
  }) {
    _status = status;
    _statusMessage = statusMessage;
    _data = data;
    _meta = meta;
  }

  SearchResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusMessage = json['status_message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _meta = json['@meta'] != null ? Meta.fromJson(json['@meta']) : null;
  }
  String? _status;
  String? _statusMessage;
  Data? _data;
  Meta? _meta;
  SearchResponse copyWith({
    String? status,
    String? statusMessage,
    Data? data,
    Meta? meta,
  }) =>
      SearchResponse(
        status: status ?? _status,
        statusMessage: statusMessage ?? _statusMessage,
        data: data ?? _data,
        meta: meta ?? _meta,
      );
  String? get status => _status;
  String? get statusMessage => _statusMessage;
  Data? get data => _data;
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['status_message'] = _statusMessage;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_meta != null) {
      map['@meta'] = _meta?.toJson();
    }
    return map;
  }
}
