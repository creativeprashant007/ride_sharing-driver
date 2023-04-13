import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'sizes.dart';

class CustomAppBar extends StatelessWidget {
  final bool hasMenuItems;
  const CustomAppBar({Key? key, this.hasMenuItems = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 1.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 5.h,
                width: 5.h,
                decoration: BoxDecoration(
                  color: const Color(0xfffafafa),
                  borderRadius: BorderRadius.circular(13.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 2),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xfffafafa),
                        borderRadius: BorderRadius.circular(13.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const Alignment(-0.302, -0.297),
                      child: Container(
                        width: 1.5.w,
                        height: 1.5.w,
                        decoration: const BoxDecoration(
                          color: Color(0xff000000),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.302, -0.297),
                      child: Container(
                        width: 1.5.w,
                        height: 1.5.w,
                        decoration: const BoxDecoration(
                          color: Color(0xff000000),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.302, 0.297),
                      child: Container(
                        width: 1.5.w,
                        height: 1.5.w,
                        decoration: const BoxDecoration(
                          color: Color(0xffe9003f),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(-0.302, 0.297),
                      child: Container(
                        width: 1.5.w,
                        height: 1.5.w,
                        decoration: const BoxDecoration(
                          color: Color(0xff000000),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    // final TabScreenController controller = Get.find();
                    // controller.changeCurrentIndex(0);
                    // controller.update();
                  },
                  child: const Text("Skeleton")),
              Container(
                width: AppSize.width(10),
                height: AppSize.width(10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
