import 'package:driver/app/modules/home/views/home_view.dart';
import 'package:driver/app/widgets/atoms/tab_component.dart';
import 'package:driver/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DriverdashboardController extends GetxController {
  PersistentTabController? persistentTabController;

  var currentIndex = -1.obs;

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      tabItem(
        iconName: Icons.home,
        tabName: "Home",
      ),
      tabItem(
        iconName: Icons.card_giftcard,
        tabName: "Earning",
      ),
      tabItem(
        iconName: Icons.star,
        tabName: "Rating",
      ),
      tabItem(
        iconName: Icons.person,
        tabName: "Account",
      ),
    ];
  }

  List<Widget> changeTabScreen() {
    return tabScreen;
  }

  List<Widget> tabScreen = [
    const HomeView(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  void onInit() {
    persistentTabController = PersistentTabController();
    super.onInit();
  }

  PersistentBottomNavBarItem tabItem(
      {required IconData iconName, required String tabName}) {
    return PersistentBottomNavBarItem(
      iconSize: 15,
      contentPadding: 0,
      textStyle: TextStyle(
          fontSize: 2.sp, color: Colors.white, fontWeight: FontWeight.bold),
      icon: TabComponent(
        selected: true,
        title: tabName,
        icon: iconName,
      ),
      inactiveIcon: TabComponent(
        selected: false,
        title: tabName,
        icon: iconName,
      ),
      activeColorPrimary: AppColors.primaryColor,
      inactiveColorPrimary: AppColors.primaryColor,
    );
  }

  changeCurrentIndex(int index) {
    currentIndex = index;
    persistentTabController!.index = index;
    /*
    if (currentBusinessType == BusinessType.town) {
      switch (currentIndex) {
        case 0:
          title.value = 'home';
          break;
        case 1:
          title.value = 'profile';
          break;
        default:
          title.value = 'home';
      }
    } else {
      switch (currentIndex) {
        case 0:
          title.value = 'inquiry';
          break;
        case 1:
          title.value = 'home';
          break;
        case 2:
          title.value = 'profile';
          break;
        default:
          title.value = 'home';
      }
    }
    */
  }
}
