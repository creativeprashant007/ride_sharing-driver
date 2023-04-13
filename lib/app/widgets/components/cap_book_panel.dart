import 'package:driver/app/widgets/atoms/buttons.dart';
import 'package:driver/utils/asset_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';

class CapBookPanel extends StatelessWidget {
  CapBookPanel({
    Key? key,
    required this.distance,
    required this.totalBill,
    required this.onBookCallBack,
  }) : super(key: key);
  String distance;
  String totalBill;
  VoidCallback onBookCallBack;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: AppColors.statusbarcolor1.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetStrings.car,
                  height: 50.h,
                  width: 100.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0.w),
                  child: Column(
                    children: [
                      Text(
                        'Taxi',
                        style: Get.theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        distance,
                        style: Get.theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.blackColor.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
                Text(
                  totalBill,
                  style: Get.theme.textTheme.bodyMedium!.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0.w),
          child: Row(
            children: [
              Icon(
                Icons.payment,
                size: 20,
                color: AppColors.blackColor.withOpacity(0.7),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'Cash',
                style: Get.theme.textTheme.bodyMedium!.copyWith(
                  color: AppColors.blackColor.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 15,
                color: AppColors.blackColor.withOpacity(0.7),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Button(
            onPressed: () {},
            borderRadius: BorderRadius.circular(8.r),
            size: ButtonSize.medium,
            fillColor: AppColors.errorColor,
            splashColor: AppColors.whiteDimColor,
            child: Text(
              " REQUEST CAB ",
              style: Get.theme.textTheme.labelLarge,
            ),
          ),
        ),
      ],
    );
  }
}
