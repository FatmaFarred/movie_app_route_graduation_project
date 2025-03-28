import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/google_login_online_data_source.dart';
import 'package:movie_app_route_graduation_project/domain/repositries/google_login_repo.dart';

@Injectable(as: GoogleLoginRepo)
class GoogleLoginRepoImpl implements GoogleLoginRepo{

  final GoogleLoginOnlineDataSource _googleLoginOnlineDataSource;

  GoogleLoginRepoImpl(this._googleLoginOnlineDataSource);

  @override
  Future<User?> googleLogin() {
    return _googleLoginOnlineDataSource.googleLogin();
  }

}