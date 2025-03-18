import '../../domain/entities/profile.dart';

class ProfileDTO {
  ProfileDTO({
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

  ProfileDTO.fromJson(dynamic json) {
    _id = json['_id'];
    _email = json['email'];
    _password = json['password'];
    _name = json['name'];
    _phone = json['phone'];
    _avaterId = json['avaterId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
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

  ProfileDTO copyWith({
    String? id,
    String? email,
    String? password,
    String? name,
    String? phone,
    int? avaterId,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) =>
      ProfileDTO(
        id: id ?? _id,
        email: email ?? _email,
        password: password ?? _password,
        name: name ?? _name,
        phone: phone ?? _phone,
        avaterId: avaterId ?? _avaterId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );

  String? get id => _id;

  String? get email => _email;

  String? get password => _password;

  String? get name => _name;

  String? get phone => _phone;

  int? get avaterId => _avaterId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['email'] = _email;
    map['password'] = _password;
    map['name'] = _name;
    map['phone'] = _phone;
    map['avaterId'] = _avaterId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

  Profile toProfile() {
    return Profile(
        id: id,
        email: email,
        password: password,
        name: name,
        phone: phone,
        avaterId: avaterId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v);
  }
}
