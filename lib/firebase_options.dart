// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAE7ev3rUgTCIHppBnRN1yVDlsXdpAKhic',
    appId: '1:715071474635:web:944fad89510fc819ba444e',
    messagingSenderId: '715071474635',
    projectId: 'callapp-b7985',
    authDomain: 'callapp-b7985.firebaseapp.com',
    storageBucket: 'callapp-b7985.appspot.com',
    measurementId: 'G-KXSF376CKJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcAXlo_BmbrX-CvC2Vfott8a8xF0JpQsY',
    appId: '1:715071474635:android:c89ac305bad75449ba444e',
    messagingSenderId: '715071474635',
    projectId: 'callapp-b7985',
    storageBucket: 'callapp-b7985.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlUCHiKkOXoIPEiOWszHwheVNArsy2Z3Y',
    appId: '1:715071474635:ios:9f90217f04b3bf74ba444e',
    messagingSenderId: '715071474635',
    projectId: 'callapp-b7985',
    storageBucket: 'callapp-b7985.appspot.com',
    iosBundleId: 'com.example.callingapp',
  );
}
