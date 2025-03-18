class Profile {
  Profile({
    String? id,
    String? email,
    String? password,
    String? name,
    String? phone,
    int? avaterId,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    _id = id;
    _email = email;
    _password = password;
    _name = name;
    _phone = phone;
    _avaterId = avaterId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  String? _id;
  String? _email;
  String? _password;
  String? _name;
  String? _phone;
  int? _avaterId;
  String? _createdAt;
  String? _updatedAt;
  int? _v;

  String? get id => _id;
  String? get email => _email;
  String? get password => _password;
  String? get name => _name;
  String? get phone => _phone;
  int? get avaterId => _avaterId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;
}
