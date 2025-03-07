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
    apiKey: 'AIzaSyBsXWQXcUbHqCpJzMoErznQnEy9_3K6J-0',
    appId: '1:498249364506:web:c1a2285ea9a90664150da3',
    messagingSenderId: '498249364506',
    projectId: 'giuaki-7d315',
    authDomain: 'giuaki-7d315.firebaseapp.com',
    storageBucket: 'giuaki-7d315.appspot.com',
    measurementId: 'G-P2M6XCQCNR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRHw72A2EFJima8muP3zgNmjdnVjozdHE',
    appId: '1:498249364506:android:710adcb03d02cbc6150da3',
    messagingSenderId: '498249364506',
    projectId: 'giuaki-7d315',
    storageBucket: 'giuaki-7d315.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgHbsienqrTdzCGjBjMiXHXwZnU01o0mo',
    appId: '1:498249364506:ios:5feb29c19d588b8a150da3',
    messagingSenderId: '498249364506',
    projectId: 'giuaki-7d315',
    storageBucket: 'giuaki-7d315.appspot.com',
    iosBundleId: 'com.example.giuaki',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgHbsienqrTdzCGjBjMiXHXwZnU01o0mo',
    appId: '1:498249364506:ios:5feb29c19d588b8a150da3',
    messagingSenderId: '498249364506',
    projectId: 'giuaki-7d315',
    storageBucket: 'giuaki-7d315.appspot.com',
    iosBundleId: 'com.example.giuaki',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBsXWQXcUbHqCpJzMoErznQnEy9_3K6J-0',
    appId: '1:498249364506:web:12421a0f8f76a00a150da3',
    messagingSenderId: '498249364506',
    projectId: 'giuaki-7d315',
    authDomain: 'giuaki-7d315.firebaseapp.com',
    storageBucket: 'giuaki-7d315.appspot.com',
    measurementId: 'G-DJKW96TZ86',
  );

}