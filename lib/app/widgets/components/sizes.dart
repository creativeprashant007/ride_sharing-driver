import 'package:get/get.dart';

class AppSize {
  //get percentage of screen width
  static double width(double percentage) {
    return Get.width * (percentage / 100);
  }

  //get percentage of screen height
  static double height(double percentage) {
    return Get.height * (percentage / 100);
  }

  //font size of text
  static double font(double percentage) {
    return Get.width * (percentage / 100);
  }
}
