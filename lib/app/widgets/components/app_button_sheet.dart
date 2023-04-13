import 'package:driver/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtomSheetLayout extends StatelessWidget {
  AppButtomSheetLayout(
      {Key? key,
      required this.sheetHeight,
      this.child,
      this.horizontal = 24,
      this.vertical = 18})
      : super(key: key);
  double? sheetHeight;
  Widget? child;
  double? horizontal;
  double? vertical;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(microseconds: 150),
      curve: Curves.easeIn,
      child: Container(
        height: sheetHeight,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 15.r,
                spreadRadius: 0.5.r,
                offset: const Offset(0.7, 0.7),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontal!.w,
            vertical: vertical!.h,
          ),
          child: child,
        ),
      ),
    );
  }
}
