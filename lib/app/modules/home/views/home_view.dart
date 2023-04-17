import 'package:driver/app/widgets/atoms/buttons.dart';
import 'package:driver/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 100.h,
          color: AppColors.statusbarcolor1,
          child: Padding(
            padding: EdgeInsets.only(top: 15.0.h),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 50.w,
                ),
                child: Button(
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(8.r),
                  size: ButtonSize.small,
                  fillColor: AppColors.whiteColor,
                  splashColor: AppColors.whiteDimColor,
                  child: Text(
                    " GO OFFLINE ",
                    style: Get.theme.textTheme.labelLarge!.copyWith(
                      color: AppColors.errorColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GoogleMap(
            //padding: EdgeInsets.only(bottom: 256.h),
            initialCameraPosition: controller.initialCameraPosition,
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController con) {
              controller.onMapCreated(controller: con);
            },
          ),
        ),
      ],
    ));
  }
}
