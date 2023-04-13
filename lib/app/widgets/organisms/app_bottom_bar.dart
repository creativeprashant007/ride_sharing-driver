import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

// ignore: must_be_immutable
class AppButtonTab extends StatelessWidget {
  AppButtonTab({
    Key? key,
    required this.tabs,
    required this.tabController,
    required this.onTap,
  }) : super(key: key);

  List<Widget> tabs;
  final TabController tabController;
  Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      controller: tabController,
      indicatorColor: Colors.transparent,
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: AppColors.primaryColor.withOpacity(0.4),
      labelStyle: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      tabs: tabs,
    );
  }
}
