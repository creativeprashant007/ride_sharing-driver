import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

class AuthChecker extends StatefulWidget {
  final String messageTitle;
  final String message;
  final String confirmText;
  final Function onConfirm;

  const AuthChecker(
      {Key? key,
      this.messageTitle = "Error",
      this.message = "Your access token has expired. Please login again.",
      required this.onConfirm,
      this.confirmText = "OK"})
      : super(key: key);

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  void initState() {
    super.initState();
    displayDialog();
  }

  displayDialog() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.defaultDialog(
      title: widget.messageTitle,
      middleText: widget.message,
      textConfirm: widget.confirmText,
      confirmTextColor: AppColors.primaryColor,
      barrierDismissible: false,
      onConfirm: () => widget.onConfirm(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: const [],
      )),
    );
  }
}
