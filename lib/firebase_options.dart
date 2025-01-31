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
    apiKey: 'AIzaSyD269SoJUuoCnXL1oSrc21Yk4b0iaqHFL0',
    appId: '1:630626411694:web:cb5431bcceae1e44f4793f',
    messagingSenderId: '630626411694',
    projectId: 'gup-chup-589d9',
    authDomain: 'gup-chup-589d9.firebaseapp.com',
    storageBucket: 'gup-chup-589d9.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDa5qX6Bnshy0zcU5AUH4nVHo_-timXA6c',
    appId: '1:630626411694:android:1e05ca37735d6508f4793f',
    messagingSenderId: '630626411694',
    projectId: 'gup-chup-589d9',
    storageBucket: 'gup-chup-589d9.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOQsWXxoMv2NI5FO7SxlvCqvLgaNf_O0M',
    appId: '1:630626411694:ios:0e2045aa2abd24e6f4793f',
    messagingSenderId: '630626411694',
    projectId: 'gup-chup-589d9',
    storageBucket: 'gup-chup-589d9.firebasestorage.app',
    iosBundleId: 'com.example.gupChup',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOQsWXxoMv2NI5FO7SxlvCqvLgaNf_O0M',
    appId: '1:630626411694:ios:0e2045aa2abd24e6f4793f',
    messagingSenderId: '630626411694',
    projectId: 'gup-chup-589d9',
    storageBucket: 'gup-chup-589d9.firebasestorage.app',
    iosBundleId: 'com.example.gupChup',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD269SoJUuoCnXL1oSrc21Yk4b0iaqHFL0',
    appId: '1:630626411694:web:71460380caa3f63bf4793f',
    messagingSenderId: '630626411694',
    projectId: 'gup-chup-589d9',
    authDomain: 'gup-chup-589d9.firebaseapp.com',
    storageBucket: 'gup-chup-589d9.firebasestorage.app',
  );
}
