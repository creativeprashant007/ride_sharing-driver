import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

// ignore: must_be_immutable
class AppDropDownButton extends StatelessWidget {
  AppDropDownButton({
    Key? key,
    required this.height,
    required this.width,
    this.radius,
    required this.title,
    required this.callback,
  }) : super(key: key);
  double? height;
  double? width;
  double? radius;
  String? title;
  VoidCallback? callback;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor1,
        border: Border.all(color: AppColors.borderColor, width: 1.sp),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 13.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryColor,
              ),
            ),
            IconButton(
              onPressed: callback,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
