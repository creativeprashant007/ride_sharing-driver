import 'dart:io';

import 'package:driver/functions/universal_functions.dart';
import 'package:driver/utils/memory_management.dart';
import 'package:driver/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/network/api_handler.dart';
import 'app/routes/app_pages.dart';
import 'functions/firebase_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  APIHandler.initDio();
  MemoryManagement.init();
  await Firebase.initializeApp();

  getCurrentUserInfo();

  final FirebaseApp app = await Firebase.initializeApp(
    // name: 'db7',
    options: Platform.isIOS
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
            databaseURL:
                "https://ridesharing-584f0-default-rtdb.firebaseio.com",
          ),
  );
  FirebaseServices firebaseServices = FirebaseServices.instance;
  firebaseServices.defaultApp = await firebaseServices.initialiseFirebase();
  firebaseServices.messaging = await firebaseServices.initFirebaseMessaging();
  firebaseServices.settings =
      await firebaseServices.initFirebaseNotificationSettings();
  firebaseServices.defaultApp?.setAutomaticDataCollectionEnabled(true);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    firebaseServices.onMessage(message);
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    if (message.notification != null) {
      Get.snackbar(
        message.notification!.title!,
        message.notification!.body!,
        snackPosition: SnackPosition.TOP,
      );
      print('Message also contained a notification: ${message.notification!.title!}');
    }
  });

  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: ((context, child) {
        return GetMaterialApp(
            builder: EasyLoading.init(),
            title: "Application",
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            defaultTransition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 500),
            home: child);
      }),
    ),
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.data);
  print("Handling a background message: ${message.messageId}");
}
