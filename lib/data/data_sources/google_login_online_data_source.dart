import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleLoginOnlineDataSource{
  Future<User?> googleLogin();
}