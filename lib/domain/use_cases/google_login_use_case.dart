import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../repositries/google_login_repo.dart';

@injectable
class GoogleLoginUseCase{
  final GoogleLoginRepo _googleLoginRepo;

  GoogleLoginUseCase(this._googleLoginRepo);

  Future<User?> call(){
    return _googleLoginRepo.googleLogin();
  }
}