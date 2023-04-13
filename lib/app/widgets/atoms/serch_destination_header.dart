import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchDestinationHeading extends StatelessWidget {
  const SearchDestinationHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: Get.width,
          child: Text(
            "Set Destination",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
        ),
        Positioned(
          left: -15.w,
          top: -5.h,
          bottom: 0,
          child: IconButton(
            onPressed: () => {Get.back()},
            icon: const Icon(Icons.arrow_back),
          ),
        ),
      ],
    );
  }
}
