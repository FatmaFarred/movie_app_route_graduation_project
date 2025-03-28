import 'package:movie_app_route_graduation_project/domain/entities/register_response_entity.dart';

/// message : "User created successfully"
/// data : {"email":"atry2@gmail.com","password":"$2b$10$Rlld/jufcOhu5xDaTHLu4ODDIQGQNU5Db6h3DhlOnIHoFzSwf.NWq","name":"t murtafa","phone":"+201122299334","avaterId":1,"_id":"67a8e4c766c7c4e5bd2f0b00","createdAt":"2025-02-09T17:24:23.198Z","updatedAt":"2025-02-09T17:24:23.198Z","__v":0}

class RegisterResponseDm extends RegisterResponseEntity{
  RegisterResponseDm({
      super.message,
      super.data,
    super.statusCode

  });

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    data = json['data']!= null ? UserDm.fromJson(json['data']) : null ;
    statusCode=json['statusCode'];
  }




}

/// email : "atry2@gmail.com"
/// password : "$2b$10$Rlld/jufcOhu5xDaTHLu4ODDIQGQNU5Db6h3DhlOnIHoFzSwf.NWq"
/// name : "t murtafa"
/// phone : "+201122299334"
/// avaterId : 1
/// _id : "67a8e4c766c7c4e5bd2f0b00"
/// createdAt : "2025-02-09T17:24:23.198Z"
/// updatedAt : "2025-02-09T17:24:23.198Z"
/// __v : 0

class UserDm extends UserEntity {
  UserDm({
      super.email,
    super.password,
    super.name,
    super.phone,
    super.avaterId,
    super.id,
    super.createdAt,
    super.updatedAt,
    super.v,});

  UserDm.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }




}