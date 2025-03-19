/// message : "Success Login"
/// data : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YWI5ZTYwYmQxODQ4NTU3OWYyMzhkZCIsImVtYWlsIjoiRmF0bWE3OEBnbWFpbC5jb20iLCJpYXQiOjE3MzkzMTI5NTl9.ZJE2tj8U3KBFPDqCAfd7iVU2rCIgXlZ9Nv9OXicVEOI"

class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.data,
      this.statusCode,
  });


  String? message;
  String? data;
  int? statusCode;




}