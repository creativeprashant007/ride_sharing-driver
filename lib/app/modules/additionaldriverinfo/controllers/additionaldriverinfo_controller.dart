import 'package:driver/app/routes/app_pages.dart';
import 'package:driver/app/widgets/circular_loader.dart';
import 'package:driver/app/widgets/components/common_widgets.dart';
import 'package:driver/global_constants/global_constants.dart';
import 'package:driver/utils/dropdown_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AdditionaldriverinfoController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CircularLoader circularLoader = Get.put(CircularLoader());
  BuildContext? context;

  Map<String, dynamic> credential = {};

  String vehicle = "";

  final TextEditingController vehicleNumberController = TextEditingController();
  final TextEditingController chasisNumberController = TextEditingController();
  final TextEditingController bilBookNumberController = TextEditingController();
  final TextEditingController licenseNumberController = TextEditingController();
  final TextEditingController driverExperController = TextEditingController();
  bool isEdit = false;
  @override
  void onInit() {
    credential = Get.arguments["data"];
    isEdit = Get.arguments["isEdit"];
    super.onInit();
  }

  List<DropdownType>? vehicleType = [
    DropdownType(
      key: "Taxi",
      value: "Taxi",
    ),
    DropdownType(
      key: "Bike",
      value: "Bike",
    ),
  ];

  validateData() async {
    try {
      if (formKey.currentState!.validate()) {
        circularLoader.showCircularLoader(context!);
        Map<String, dynamic> vehicleinfo = {
          "vechicle_category": vehicle,
          "vechicle_number": vehicleNumberController.text,
          "chasis_number": chasisNumberController.text,
          "billbook_number": bilBookNumberController.text,
          "license_number": licenseNumberController.text,
          "driver_experience": driverExperController.text,
        };
        credential.addAll(vehicleinfo);

        if (isEdit) {
          DatabaseReference newUserRefrence = FirebaseDatabase.instance
              .ref()
              .child('driver/${currentUserInfo!.id!}');
          newUserRefrence.update(credential);
          successMessage(message: "Profile update successfully");
          Get.offNamedUntil(Routes.DRIVERDASHBOARD, (route) => false);
        } else {
          final UserCredential user = await auth.createUserWithEmailAndPassword(
              email: credential["email"], password: credential["password"]);

          if (user.user != null) {
            DatabaseReference newUserRefrence = FirebaseDatabase.instance
                .ref()
                .child('driver/${user.user!.uid}');

            newUserRefrence.set(credential);
            circularLoader.hideCircularLoader();
            successMessage(message: "Register successfully");
            Get.offNamedUntil(Routes.DRIVERDASHBOARD, (route) => false);
          }
        }
      }
    } on PlatformException catch (err) {
      circularLoader.hideCircularLoader();
      errorMessage(message: err.message);
    } catch (error) {
      circularLoader.hideCircularLoader();
      errorMessage(message: error.toString());
    }
  }
}
