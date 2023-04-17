import 'package:get/get.dart';

import '../controllers/driverdashboard_controller.dart';

class DriverdashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverdashboardController>(
      () => DriverdashboardController(),
    );
  }
}
