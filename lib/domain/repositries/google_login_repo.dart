import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleLoginRepo{
  Future<User?> googleLogin();
}