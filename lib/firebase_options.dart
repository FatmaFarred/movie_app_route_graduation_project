// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAoif8oPeMtaT7G_E5hWpALlWFtUje6h7U',
    appId: '1:866665570223:web:fd79d1902594c76d1ed95a',
    messagingSenderId: '866665570223',
    projectId: 'movie-app-e3f73',
    authDomain: 'movie-app-e3f73.firebaseapp.com',
    storageBucket: 'movie-app-e3f73.firebasestorage.app',
    measurementId: 'G-RR819SM3PY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHds6cayiYt4UfZBnP792Yt_vVDDRGycU',
    appId: '1:866665570223:android:5c8195245627a9ab1ed95a',
    messagingSenderId: '866665570223',
    projectId: 'movie-app-e3f73',
    storageBucket: 'movie-app-e3f73.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQOz7prhlOLbTciveVXP3TeuUXvIdkKG4',
    appId: '1:866665570223:ios:d4dfd7d37b2ab6da1ed95a',
    messagingSenderId: '866665570223',
    projectId: 'movie-app-e3f73',
    storageBucket: 'movie-app-e3f73.firebasestorage.app',
    iosClientId: '866665570223-ka44bivkdkv0c09kv9uh7d0d0km0j8mu.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieAppRouteGraduationProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCQOz7prhlOLbTciveVXP3TeuUXvIdkKG4',
    appId: '1:866665570223:ios:d4dfd7d37b2ab6da1ed95a',
    messagingSenderId: '866665570223',
    projectId: 'movie-app-e3f73',
    storageBucket: 'movie-app-e3f73.firebasestorage.app',
    iosClientId: '866665570223-ka44bivkdkv0c09kv9uh7d0d0km0j8mu.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieAppRouteGraduationProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAoif8oPeMtaT7G_E5hWpALlWFtUje6h7U',
    appId: '1:866665570223:web:454dab4235997b6c1ed95a',
    messagingSenderId: '866665570223',
    projectId: 'movie-app-e3f73',
    authDomain: 'movie-app-e3f73.firebaseapp.com',
    storageBucket: 'movie-app-e3f73.firebasestorage.app',
    measurementId: 'G-EFFLPNGR1L',
  );
}
