import 'package:driver/utils/memory_management.dart';
import 'package:driver/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/network/api_handler.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  APIHandler.initDio();
  MemoryManagement.init();

  await Firebase.initializeApp();

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
