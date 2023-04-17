import 'package:driver/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/driverdashboard_controller.dart';

class DriverdashboardView extends GetView<DriverdashboardController> {
  const DriverdashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homectrl = Get.put(HomeController());
    homectrl.context = context;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('DriverdashboardView'),
      //   centerTitle: true,
      // ),
      body: Builder(builder: (context) {
        return PersistentTabView(
          context,
          controller: controller.persistentTabController,
          screens: controller.changeTabScreen(),
          items: controller.navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows: true,
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          // margin: EdgeInsets.all(1.h),
          navBarHeight: 60.h,
          decoration: NavBarDecoration(
            boxShadow: [
              BoxShadow(
                  color: const Color.fromRGBO(111, 111, 111, 0.25),
                  offset: const Offset(0, -2),
                  blurRadius: 2.r)
            ],
          ),
          navBarStyle: NavBarStyle.style8,
          onItemSelected: (val) => controller.changeCurrentIndex(val),
        );
      }),
    );
  }
}
