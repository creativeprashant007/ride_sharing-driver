import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '/utils/colors.dart';

class TabComponent extends StatelessWidget {
  final bool selected;
  final String icon;
  final String title;
  const TabComponent({
    super.key,
    this.selected = false,
    this.icon = "home.svg",
    this.title = "Home",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
              color: selected ? AppColors.primaryColor : AppColors.whiteColor,
              borderRadius: const BorderRadius.all(Radius.elliptical(35, 35)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/images/svg/$icon",
                color: selected ? AppColors.whiteColor : AppColors.blackColor,
              ),
            )),
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: selected
                    ? const Color.fromRGBO(0, 0, 0, 1)
                    : const Color.fromRGBO(0, 0, 0, 0.6000000238418579),
                fontFamily: 'Noto Sans JP',
                fontSize: 12.sp,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
        )
      ],
    );
  }
}
