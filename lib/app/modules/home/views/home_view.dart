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
    controller.context = context;
    return Scaffold(body: GetBuilder<HomeController>(builder: (con) {
      return Column(
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
                    onPressed: () {
                      controller.onGoOnlineButtonClick();
                    },
                    borderRadius: BorderRadius.circular(8.r),
                    size: ButtonSize.small,
                    fillColor: !controller.isAvailable
                        ? AppColors.greenColor
                        : AppColors.whiteColor,
                    splashColor: AppColors.whiteDimColor,
                    child: Text(
                      controller.isAvailable ? "GO OFFLINE" : "GO ONLINE ",
                      style: Get.theme.textTheme.labelLarge!.copyWith(
                        color: !controller.isAvailable
                            ? AppColors.whiteColor
                            : AppColors.errorColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              padding: EdgeInsets.only(top: 10.h),
              initialCameraPosition: controller.initialCameraPosition,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              onMapCreated: (GoogleMapController con) {
                controller.onMapCreated(controller: con);
              },
            ),
          ),
        ],
      );
    }));
  }
}
