import 'package:driver/app/routes/app_pages.dart';
import 'package:driver/app/widgets/components/common_widgets.dart';
import 'package:driver/global_constants/global_constants.dart';
import 'package:driver/utils/dropdown_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../widgets/circular_loader.dart';

class RegistrationController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String gender = "";

  final TextEditingController usernameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CircularLoader circularLoader = Get.put(CircularLoader());
  BuildContext? context;

  RxBool isEmailAuth = true.obs;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return "Email is invalid";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be atleast 6 character";
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Mobile number is required";
    }
    if (value.length < 10 || value.length > 10) {
      return "Mobile number must be atleast 10 digits";
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Username is required";
    }

    return null;
  }

  validateData() async {
    if (formKey.currentState!.validate()) {
      try {
        Map<String, dynamic> credential = {
          "username": usernameController.text,
          "email": emailController.text,
          "phone": phoneController.text,
          "gender": gender,
          "password": passwordController.text,
        };
        Get.toNamed(Routes.ADDITIONALDRIVERINFO,
            arguments: {"data": credential});
        //signupUser();
      } catch (_) {}
    }
  }

  void clear() {
    passwordController.clear();
    emailController.clear();
    usernameController.dispose();
    phoneController.clear();
  }

  List<DropdownType>? genderType = [
    DropdownType(
      key: "Male",
      value: "Male",
    ),
    DropdownType(
      key: "Female",
      value: "Female",
    ),
    DropdownType(
      key: "Prefer not to say",
      value: "Prefer not to say",
    ),
  ];

  signupUser() async {
    try {
      circularLoader.showCircularLoader(context!);
      final UserCredential user = await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      if (user.user != null) {
        DatabaseReference newUserRefrence =
            FirebaseDatabase.instance.ref().child('users/${user.user!.uid}');
        Map userMap = {
          'name': usernameController.text.trim(),
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
          'phone': phoneController.text.trim(),
          'gender': gender,
        };
        newUserRefrence.set(userMap);
        circularLoader.hideCircularLoader();
        successMessage(message: "Register successfully");
        Get.toNamed(Routes.HOME);
      }
    } on PlatformException catch (err) {
      circularLoader.hideCircularLoader();
      errorMessage(message: err.message);
    } catch (error) {
      circularLoader.hideCircularLoader();
      errorMessage(message: error.toString());
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    usernameController.dispose();

    super.dispose();
  }
}
