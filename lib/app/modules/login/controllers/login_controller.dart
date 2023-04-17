import 'package:driver/app/routes/app_pages.dart';
import 'package:driver/app/widgets/circular_loader.dart';
import 'package:driver/app/widgets/components/common_widgets.dart';
import 'package:driver/global_constants/global_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isEmailAuth = true.obs;
  CircularLoader circularLoader = Get.put(CircularLoader());
  BuildContext? context;

  final count = 0.obs;

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

  validateData() async {
    if (formKey.currentState!.validate()) {
      try {
        signInUser();
      } catch (_) {}
    }
  }

  onSwitchAuthType() {
    if (isEmailAuth.value) {
      isEmailAuth.value = false;
    } else {
      isEmailAuth.value = true;
    }
    clear();
  }

  void clear() {
    passwordController.clear();
    emailController.clear();
    phoneController.clear();
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  signInUser() async {
    try {
      circularLoader.showCircularLoader(context!);
      final UserCredential user = await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      if (user.user != null) {
        circularLoader.hideCircularLoader();
        successMessage(message: "Login Successfull");
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
}
