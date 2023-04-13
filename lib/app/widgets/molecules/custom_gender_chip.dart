import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

// ignore: must_be_immutable
class CustomGenderChip extends StatelessWidget {
  CustomGenderChip({
    Key? key,
    this.title,
    this.isActive,
    this.pos,
    this.callback,
  }) : super(key: key);
  final String? title;
  final bool? isActive;
  final int? pos;
  final VoidCallback? callback;
  BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    if (pos == 1) {
      borderRadius = BorderRadius.only(
        topLeft: Radius.circular(8.r),
        bottomLeft: Radius.circular(8.r),
      );
    } else if (pos == 2) {
      borderRadius = BorderRadius.circular(0.r);
    } else if (pos == 3) {
      borderRadius = BorderRadius.only(
        topRight: Radius.circular(8.r),
        bottomRight: Radius.circular(8.r),
      );
    }
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isActive! ? AppColors.primaryColor : AppColors.textBoxColor,
            borderRadius: borderRadius),
        child: Text(
          title!,
          style: TextStyle(
              color: isActive! ? AppColors.whiteColor : AppColors.blackColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
