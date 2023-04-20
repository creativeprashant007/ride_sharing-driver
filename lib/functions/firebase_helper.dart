import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseServices {
  // Initialize Firebase.
  FirebaseApp? defaultApp;
  FirebaseServices._internal() {
    print("\n\nFirebase Service Internal Called....");
    // initialiseFirebase();
  }
  static final FirebaseServices _instance = FirebaseServices._internal();
  static FirebaseServices get instance => _instance;
  FirebaseMessaging? messaging;
  NotificationSettings? settings;
  String? firebaseToken;

  initialiseFirebase() {
    // defaultApp = await Firebase.initializeApp();
    return Firebase.initializeApp(options: firebaseOptions());
  }

  initFirebaseMessaging() {
    return FirebaseMessaging.instance;
  }

  initFirebaseNotificationSettings() {
    return messaging!.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
  }

  setOptions() {
    messaging!.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  getFCMToken() async {
    // SharedPreferencesHelper.setStringValue(
    //     SharedPreferenceKeys.FCM_TOKEN!, await messaging!.getToken());
    return messaging!.getToken();
  }

  onMessage(RemoteMessage message) {
    print("here it is");
    RemoteNotification notification = message.notification!;
    AndroidNotification android = AndroidNotification();
    AppleNotification apple = AppleNotification();
    print("\nOn Message Service....\n");
    print("count processing");
    // Get.put(MessagesController()).getNotificationMessages();
    // Get.put(MainPageController()).currentTabIndex.value = 2;
  }
}

onMessageOpenedApp(RemoteMessage message) {
  RemoteNotification notification = message.notification!;
  AndroidNotification android = message.notification!.android!;
  var payload = message.data;
  print("count processing");
}


FirebaseOptions firebaseOptions() {
  return Platform.isIOS
      ? const FirebaseOptions(
          appId: '1:297855924061:ios:c6de2b69b03a5be8',
          apiKey: 'AIzaSyBEnYVcxOEaejEzT6UyG8l8n5EZ2mT9C1I',
          projectId: 'flutter-firebase-plugins',
          messagingSenderId: '589846735931',
          databaseURL: 'https://cab-rider-35e1c-default-rtdb.firebaseio.com',
        )
      : const FirebaseOptions(
          appId: '1:818602134431:android:4bc8c8d9cd418606530baa',
          apiKey: "AIzaSyB1bfvCDz-0oIWHbRNyShCVv6bsHWE8jhg",
          messagingSenderId: '297855924061',
          projectId: 'flutter-firebase-plugins',
          databaseURL: "https://ridesharing-584f0-default-rtdb.firebaseio.com",
        );
}
