import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/data/data_sources/google_login_online_data_source.dart';

import '../../../api/errors/failure.dart';
import '../../../core/utils/app_constants.dart';

@Injectable(as: GoogleLoginOnlineDataSource)
class GoogleLoginOnlineDataSourceImpl implements GoogleLoginOnlineDataSource{
  @override
  Future<User?> googleLogin() async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential.user;
    } else {
      throw NetworkError(errorMessage: AppConstants.noInternetConnection);
    }
  }

}