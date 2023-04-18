import 'package:driver/app/routes/app_pages.dart';
import 'package:driver/functions/universal_functions.dart';
import 'package:driver/global_constants/global_constants.dart';
import 'package:get/get.dart';

class ProfileViewController extends GetxController {
  logout() async {
    await auth.signOut();

    if (auth.currentUser == null) {
      Get.offNamedUntil(Routes.LOGIN, (route) => false);
    }
  }

  @override
  void onInit() {
    getCurrentUserInfo();
    update();
    super.onInit();
  }
}
