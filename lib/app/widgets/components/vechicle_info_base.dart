import 'package:driver/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VechicleInfoBase extends StatelessWidget {
  final String title;
  final String? subtitle;
  const VechicleInfoBase(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Get.theme.textTheme.headlineLarge!.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor.withOpacity(0.7),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          subtitle ?? "-",
          style: Get.theme.textTheme.headlineLarge!.copyWith(
            fontSize: 10.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
