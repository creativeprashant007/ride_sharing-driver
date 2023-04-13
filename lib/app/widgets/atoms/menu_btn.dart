import 'package:driver/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MenuButton extends StatelessWidget {
  final Function onPressed;
  const MenuButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.whiteColor,
      ),
      child: IconButton(
        onPressed: () {
          onPressed();
        },
        icon: const Icon(
          Icons.menu,
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
