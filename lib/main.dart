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
  await Firebase.initializeApp(
    options: firebaseOptions(),
  );

  getCurrentUserInfo();

  FirebaseServices firebaseServices = FirebaseServices.instance;
  firebaseServices.defaultApp = await firebaseServices.initialiseFirebase();
  firebaseServices.messaging = await firebaseServices.initFirebaseMessaging();
  firebaseServices.settings = await firebaseServices.initFirebaseNotificationSettings();
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
        backgroundColor: Colors.red,
      );
      print(
          'Message also contained a notification: ${message.notification!.title!}');
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
