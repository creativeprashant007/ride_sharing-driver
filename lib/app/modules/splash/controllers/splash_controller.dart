import 'dart:async';

import 'package:driver/app/routes/app_pages.dart';
import 'package:driver/global_constants/global_constants.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final skipTime = 10.obs;
  Timer? timer;

  AnimationController? animationController;
  Animation<double> get animation =>
      Tween<double>(begin: 0.0, end: 1.0).animate(animationController!);

  @override
  void onInit() {
    loadSplash().then((value) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (skipTime.value == 0) {
          timer.cancel();
          offSplash();
        } else {
          skipTime.value--;
        }
      });
    });
    super.onInit();
  }

  Future<void> loadSplash() async {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
  }

  @override
  void onClose() {
    timer!.cancel();
    animationController!.dispose();
    super.dispose();
  }

  offSplash() {
    if (currentFirebaseUser != null) {
      Get.offAndToNamed(Routes.HOME);
    } else {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }
}
