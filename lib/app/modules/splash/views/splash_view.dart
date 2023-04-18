import 'package:driver/app/widgets/atoms/skip_splash_button.dart';
import 'package:driver/app/widgets/molecules/empty_app_bar.dart';
import 'package:driver/utils/asset_strings.dart';
import 'package:driver/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashView({Key? key}) : super(key: key);
  final SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: const EmptyAppBar(
        statusBarColor: AppColors.statusbarcolor1,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradient1,
        ),
        child: ScaleTransition(
          scale: controller.animation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetStrings.splashImage,
                width: Get.width,
                fit: BoxFit.fill,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to \nDriver App',
                      style: Get.theme.textTheme.headlineLarge!.copyWith(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.2.h,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'The app allows passengers to request a ride and pay for it through the app. The app then matches the passenger with a nearby driver who is willing to provide the ride. The driver and passenger can communicate through the app to coordinate the pick-up location and other detailsp',
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        height: 1.5.h,
                        color: AppColors.blackColor.withOpacity(0.7),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(() {
        return SkipButton(
            title: "Skip ${controller.skipTime.value}",
            onPressed: () {
              controller.offSplash();
            });
      }),
    );
  }
}
