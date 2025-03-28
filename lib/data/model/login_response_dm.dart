
import '../../domain/entities/login_response_entity.dart' show LoginResponseEntity;

/// message : "Success Login"
/// data : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YWI5ZTYwYmQxODQ4NTU3OWYyMzhkZCIsImVtYWlsIjoiRmF0bWE3OEBnbWFpbC5jb20iLCJpYXQiOjE3MzkzMTI5NTl9.ZJE2tj8U3KBFPDqCAfd7iVU2rCIgXlZ9Nv9OXicVEOI"

class LoginResponseDm extends LoginResponseEntity {
  LoginResponseDm({
      super.message,
      super.data,
    super.statusCode

  });

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
    statusCode= json['statusCode'];
  }




}