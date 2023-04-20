import 'package:driver/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


appAlertDialog(
    {required String title,
    required String middleText,
    required String textbuttonName1,
    required String textbuttonName2,
    required Function onPressedButton1,
    required Function onPressedButton2}) {
  Get.defaultDialog(
      contentPadding: EdgeInsets.all(0.sp),
      titlePadding: EdgeInsets.only(
        top: 15.h,
        left: 20.w,
        right: 20.w,
      ),
      title: title,
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Text(
          middleText,
          style: Get.theme.textTheme.subtitle2!,
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        Column(
          children: [
            Container(
              color: AppColors.greyDividerColor,
              height: 1.sp,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: Text(
                      textbuttonName1,
                      style: Get.theme.textTheme.subtitle2!.copyWith(
                          color: AppColors.darkTextColor,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      onPressedButton1();
                    },
                  ),
                  VerticalDivider(
                    color: AppColors.greyDividerColor,
                    thickness: 1.sp,
                    width: 15.w,
                  ),
                  TextButton(
                    child: Text(
                      textbuttonName2,
                      style: Get.theme.textTheme.subtitle2!.copyWith(
                          color: AppColors.successColor,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      onPressedButton2();
                    },
                  )
                ],
              ),
            )
          ],
        )
      ]);
}
