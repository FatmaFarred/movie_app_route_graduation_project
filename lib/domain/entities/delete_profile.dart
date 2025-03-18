class DeleteProfile {
  DeleteProfile({
    String? message,
  }) {
    _message = message;
  }

  String? _message;

  String? get message => _message;
}
