import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.size,
  }) : super(key: key);

  final String label;
  final Size? size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        fixedSize: size ?? Size(70.w, 70.h),
        shape: const CircleBorder(),
        backgroundColor: AppColors.backgroundColor3.withOpacity(1.0),
        foregroundColor: AppColors.fontColor.withOpacity(1.0),
        side: BorderSide(
            color: AppColors.borderColor1.withOpacity(1.0), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24.sp,
          color: AppColors.fontColor.withOpacity(1.0),
        ),
      ),
    );
  }
}
