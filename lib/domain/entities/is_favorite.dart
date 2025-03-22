class IsFavorite {
  IsFavorite({
    String? message,
    bool? data,
  }) {
    _message = message;
    _data = data;
  }

  String? _message;
  bool? _data;

  String? get message => _message;
  bool? get data => _data;
}
