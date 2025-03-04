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
    apiKey: 'AIzaSyBTuLzakSAURdyVKxgM5jeOsxl_Lm2BOw0',
    appId: '1:329259036359:web:3bef4b488331f8f79a18e2',
    messagingSenderId: '329259036359',
    projectId: 'dimas-b520b',
    authDomain: 'dimas-b520b.firebaseapp.com',
    storageBucket: 'dimas-b520b.appspot.com',
    measurementId: 'G-KXM4PMJESF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCT4faxi7gnFfoJ0GBPZRX8gLUzJKo9Jbo',
    appId: '1:329259036359:android:bcdf31d562e8fa419a18e2',
    messagingSenderId: '329259036359',
    projectId: 'dimas-b520b',
    storageBucket: 'dimas-b520b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3egt36g7fXmybBLCYc2j7PTcPvnGjt1w',
    appId: '1:227153436753:ios:57833d8cda111aea605870',
    messagingSenderId: '227153436753',
    projectId: 'tugas-ffa67',
    storageBucket: 'tugas-ffa67.appspot.com',
    iosBundleId: 'com.example.tugasKelompok',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD3egt36g7fXmybBLCYc2j7PTcPvnGjt1w',
    appId: '1:227153436753:ios:57833d8cda111aea605870',
    messagingSenderId: '227153436753',
    projectId: 'tugas-ffa67',
    storageBucket: 'tugas-ffa67.appspot.com',
    iosBundleId: 'com.example.tugasKelompok',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCmhAJGtYnZ7xOlios-QeQkcoS0lqih2MY',
    appId: '1:227153436753:web:9ce982549e8aeb5d605870',
    messagingSenderId: '227153436753',
    projectId: 'tugas-ffa67',
    authDomain: 'tugas-ffa67.firebaseapp.com',
    storageBucket: 'tugas-ffa67.appspot.com',
    measurementId: 'G-GJV66CEN97',
  );

}