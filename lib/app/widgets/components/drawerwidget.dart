import 'package:driver/app/widgets/atoms/drawer_list.dart';
import 'package:driver/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final ScrollController x = ScrollController();
  Map<String, dynamic> userdetails = {};
  List<Map<String, dynamic>> pages = [
    {"text": "Free rides", "icons": Icons.card_giftcard},
    {"text": "Payments", "icons": Icons.payment},
    {"text": "Ride History", "icons": Icons.history},
    {"text": "Support", "icons": Icons.question_mark_rounded},
    {"text": "About", "icons": Icons.info},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: x,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 150,
          decoration: const BoxDecoration(
            color: AppColors.statusbarcolor1,
          ),
          padding: EdgeInsets.only(top: 15.h, left: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 80.w,
                width: 80.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.whiteColor,
                ),
                child: Icon(
                  Icons.person,
                  size: 30.h,
                  color: AppColors.blackColor.withOpacity(0.7),
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'USER NAME',
                      style: Get.theme.textTheme.headlineLarge!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    InkWell(
                      onTap: () {
                        print("view profle click");
                      },
                      child: Text(
                        'View Profile',
                        style: Get.theme.textTheme.headlineLarge!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        ...List.generate(
          pages.length,
          (index) => DrawerList(
            text: pages[index]["text"],
            icons: pages[index]['icons'],
            tap: () {},
          ),
        ),
      ],
    );
  }
}
