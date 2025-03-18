class UpdateProfile {
  UpdateProfile({
    String? message,
  }) {
    _message = message;
  }

  String? _message;

  String? get message => _message;
}
