import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

// ignore: must_be_immutable
class AppDivider extends StatelessWidget {
  AppDivider({
    Key? key,
    this.color,
    this.thickness,
  }) : super(key: key);

  Color? color;
  double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.borderColor,
      thickness: thickness ?? 1.sp,
      height: 15.h,
    );
  }
}
