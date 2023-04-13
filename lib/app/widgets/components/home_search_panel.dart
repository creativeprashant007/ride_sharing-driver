import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/colors.dart';
import '../atoms/app_divider.dart';

class HomeSearchPanel extends StatelessWidget {
  HomeSearchPanel({
    Key? key,
    required this.userHomeAddress,
    required this.searchCallback,
  }) : super(key: key);
  String userHomeAddress;
  VoidCallback searchCallback;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          'Nice to see you!',
          style: TextStyle(fontSize: 10.sp),
        ),
        Text(
          'Where are you going!',
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: searchCallback,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: AppColors.appBoxShadow),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: const [
                  Icon(Icons.search, color: AppColors.blackColor),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Search Destination',
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FaIcon(Icons.home, color: AppColors.borderColor),
            const SizedBox(
              width: 12.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userHomeAddress,
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Your residential address',
                  style:
                      TextStyle(fontSize: 11.sp, color: AppColors.borderColor),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        AppDivider(),
        SizedBox(
          height: 10.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FaIcon(Icons.work_outline, color: AppColors.borderColor),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Work'),
                SizedBox(
                  height: 3.h,
                ),
                const Text(
                  'Your office address',
                  style: TextStyle(fontSize: 11, color: AppColors.borderColor),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
