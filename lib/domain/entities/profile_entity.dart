class ProfileEntity {
  ProfileEntity({
    String? email,
    String? name,
    String? phone,
    int? avaterId,
  }) {
    _email = email;
    _name = name;
    _phone = phone;
    _avaterId = avaterId;
  }

  String? _email;
  String? _name;
  String? _phone;
  int? _avaterId;

  String? get email => _email;
  String? get name => _name;
  String? get phone => _phone;
  int? get avaterId => _avaterId;
}
