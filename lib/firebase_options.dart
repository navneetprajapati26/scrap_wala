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
    apiKey: 'AIzaSyDUTxymEsaKcl0J3uiGGYBXWqtbwkdVkUc',
    appId: '1:758292373376:web:0a948db0e79d82559eeb65',
    messagingSenderId: '758292373376',
    projectId: 'scrapwala-a04bb',
    authDomain: 'scrapwala-a04bb.firebaseapp.com',
    storageBucket: 'scrapwala-a04bb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIb_nZmbrA_xpW6tEKIR1LnE9a-_Xbz3E',
    appId: '1:758292373376:android:5e5cb213f90622609eeb65',
    messagingSenderId: '758292373376',
    projectId: 'scrapwala-a04bb',
    storageBucket: 'scrapwala-a04bb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2_OLje7Jce7G20aa2xdal6jLqGxQPPWA',
    appId: '1:758292373376:ios:5cd41d340adb223b9eeb65',
    messagingSenderId: '758292373376',
    projectId: 'scrapwala-a04bb',
    storageBucket: 'scrapwala-a04bb.appspot.com',
    iosClientId: '758292373376-c24pcqpr3nhgdr6b8r0at91pt5434vu7.apps.googleusercontent.com',
    iosBundleId: 'com.scrapwala.admin.scrapWala',
  );
}
