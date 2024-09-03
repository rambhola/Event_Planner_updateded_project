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
    apiKey: 'AIzaSyDQWKBAnuZQ5wBulaB0q7Bq8srbDax2veU',
    appId: '1:556277665925:web:a1f9501d34d2155dfe59ec',
    messagingSenderId: '556277665925',
    projectId: 'event-planeer-05-30a5a',
    authDomain: 'event-planeer-05-30a5a.firebaseapp.com',
    storageBucket: 'event-planeer-05-30a5a.appspot.com',
    measurementId: 'G-MBME0VWV6G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4ed1EBx58xk6NxH5gfYXv0jAiN0LiA_M',
    appId: '1:556277665925:android:f463b6396f3c3db4fe59ec',
    messagingSenderId: '556277665925',
    projectId: 'event-planeer-05-30a5a',
    storageBucket: 'event-planeer-05-30a5a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDapwSEy_49eGM3dXQFdYgN6qAdr5N5vk',
    appId: '1:556277665925:ios:15aa3675a8763fd9fe59ec',
    messagingSenderId: '556277665925',
    projectId: 'event-planeer-05-30a5a',
    storageBucket: 'event-planeer-05-30a5a.appspot.com',
    iosBundleId: 'com.annovasolutions.eventplaneer05.eventPlaneer05',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDapwSEy_49eGM3dXQFdYgN6qAdr5N5vk',
    appId: '1:556277665925:ios:15aa3675a8763fd9fe59ec',
    messagingSenderId: '556277665925',
    projectId: 'event-planeer-05-30a5a',
    storageBucket: 'event-planeer-05-30a5a.appspot.com',
    iosBundleId: 'com.annovasolutions.eventplaneer05.eventPlaneer05',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDQWKBAnuZQ5wBulaB0q7Bq8srbDax2veU',
    appId: '1:556277665925:web:22c93cac1a123659fe59ec',
    messagingSenderId: '556277665925',
    projectId: 'event-planeer-05-30a5a',
    authDomain: 'event-planeer-05-30a5a.firebaseapp.com',
    storageBucket: 'event-planeer-05-30a5a.appspot.com',
    measurementId: 'G-N37C4ZE1GB',
  );
}
