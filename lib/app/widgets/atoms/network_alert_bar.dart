import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import '/utils/colors.dart';

class NetworkAlertBar extends StatelessWidget {
  const NetworkAlertBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: AppColors.errorColor,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            textDirection: ui.TextDirection.ltr,
            children: [
              const Icon(
                Icons.error,
                color: AppColors.whiteColor,
                textDirection: ui.TextDirection.ltr,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "no_internet_connection".tr,
                textDirection: ui.TextDirection.ltr,
                style: Get.textTheme.caption!
                    .copyWith(color: AppColors.whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
