import 'package:get/get.dart';

import '../controllers/additionaldriverinfo_controller.dart';

class AdditionaldriverinfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdditionaldriverinfoController>(
      () => AdditionaldriverinfoController(),
    );
  }
}
