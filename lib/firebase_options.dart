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
    apiKey: 'AIzaSyATIhHBzPVqp5SNA5Ikt01x-ES_q5vpCRw',
    appId: '1:466439248382:web:07c82a43fe2749dfe8c8af',
    messagingSenderId: '466439248382',
    projectId: 'cryptext2',
    authDomain: 'cryptext2.firebaseapp.com',
    storageBucket: 'cryptext2.firebasestorage.app',
    measurementId: 'G-BCEZ5W4YH3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-YE77mB51RnX-kL7Z3XS2aXA_ugxKcCc',
    appId: '1:466439248382:android:c9a1a9227385a666e8c8af',
    messagingSenderId: '466439248382',
    projectId: 'cryptext2',
    storageBucket: 'cryptext2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAC7tvHEzZfLIo7Uv_ycl6ndO-2VCeehzI',
    appId: '1:466439248382:ios:40e2eab3fa841469e8c8af',
    messagingSenderId: '466439248382',
    projectId: 'cryptext2',
    storageBucket: 'cryptext2.firebasestorage.app',
    iosBundleId: 'com.nodamngoodstudios.cryptext2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAC7tvHEzZfLIo7Uv_ycl6ndO-2VCeehzI',
    appId: '1:466439248382:ios:40e2eab3fa841469e8c8af',
    messagingSenderId: '466439248382',
    projectId: 'cryptext2',
    storageBucket: 'cryptext2.firebasestorage.app',
    iosBundleId: 'com.nodamngoodstudios.cryptext2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyATIhHBzPVqp5SNA5Ikt01x-ES_q5vpCRw',
    appId: '1:466439248382:web:b599f716bacd3d7ae8c8af',
    messagingSenderId: '466439248382',
    projectId: 'cryptext2',
    authDomain: 'cryptext2.firebaseapp.com',
    storageBucket: 'cryptext2.firebasestorage.app',
    measurementId: 'G-WVNKHEFSQV',
  );
}
