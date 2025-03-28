/// message : "User created successfully"
/// data : {"email":"ary2@gmail.com","password":"$2b$10$xnpxO8eL8IDVrsG0YLdZxOaVaYWbCIU4fc54Te4OFudO/tsLWKu8u","name":"amy murtafa","phone":"+201121299334","avaterId":1,"_id":"67a8dc2766c7c4e5bd2f0aef","createdAt":"2025-02-09T16:47:35.454Z","updatedAt":"2025-02-09T16:47:35.454Z","__v":0}

class RegisterResponseEntity {
  RegisterResponseEntity({this.message, this.data, this.statusCode});

  String? message;
  UserEntity? data;
  int? statusCode;
}

/// email : "ary2@gmail.com"
/// password : "$2b$10$xnpxO8eL8IDVrsG0YLdZxOaVaYWbCIU4fc54Te4OFudO/tsLWKu8u"
/// name : "amy murtafa"
/// phone : "+201121299334"
/// avaterId : 1
/// _id : "67a8dc2766c7c4e5bd2f0aef"
/// createdAt : "2025-02-09T16:47:35.454Z"
/// updatedAt : "2025-02-09T16:47:35.454Z"
/// __v : 0

class UserEntity {
  UserEntity({
    this.email,
    this.password,
    this.name,
    this.phone,
    this.avaterId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;
}
