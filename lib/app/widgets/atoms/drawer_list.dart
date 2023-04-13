import 'package:driver/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DrawerList extends StatelessWidget {
  final String text;
  final IconData icons;

  final Function? tap;

  const DrawerList({
    super.key,
    required this.text,
    required this.icons,
    required this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        tap!();
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icons,
            size: 25.sp,
            color: AppColors.blackColor.withOpacity(0.7),
          ),
          SizedBox(
            width: 50.w,
          ),
          Text(
            text,
            style: Get.theme.textTheme.headlineLarge!.copyWith(
              fontSize: 14.5.sp,
              fontWeight: FontWeight.w500,
              height: 1.2.h,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
