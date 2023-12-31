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
    apiKey: 'AIzaSyB46r8p82_nx4pciuWUQpMGdeWrr9LS0QQ',
    appId: '1:335407829854:web:7eb2950d41eb4f59a575cf',
    messagingSenderId: '335407829854',
    projectId: 'bank-auction-hub',
    authDomain: 'bank-auction-hub.firebaseapp.com',
    storageBucket: 'bank-auction-hub.appspot.com',
    measurementId: 'G-DD7PYSYET5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAv0rpIrrfOH7z5elRZFFRUZtbhEu9W_Jo',
    appId: '1:335407829854:android:e494df97b32102e8a575cf',
    messagingSenderId: '335407829854',
    projectId: 'bank-auction-hub',
    storageBucket: 'bank-auction-hub.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYhWZxvxCXQE5LamESzbLoa0TpjWpnIY4',
    appId: '1:335407829854:ios:c250f04628f5b0cba575cf',
    messagingSenderId: '335407829854',
    projectId: 'bank-auction-hub',
    storageBucket: 'bank-auction-hub.appspot.com',
    iosBundleId: 'com.example.bankAuctionHub',
  );
}
