import 'package:driver/app/routes/app_pages.dart';
import 'package:driver/app/widgets/components/vechicle_info_base.dart';
import 'package:driver/global_constants/global_constants.dart';
import 'package:driver/utils/asset_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../controllers/profile_view_controller.dart';

class ProfileViewView extends GetView<ProfileViewController> {
  const ProfileViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder(
      init: ProfileViewController(),
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            top: 50.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      controller.logout();
                    },
                    icon: const Icon(Icons.logout),
                  ),
                ),
                Center(
                    child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 120.w,
                      height: 120.w,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(120)),
                        color: AppColors.statusbarcolor1,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 100.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Transform.scale(
                          scale: 2,
                          child: Transform.translate(
                            offset: Offset(0, 5.h),
                            child: FadeInImage.assetNetwork(
                              image: "",
                              fit: BoxFit.fitHeight,
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  AssetStrings.splashImage,
                                );
                              },
                              placeholder: AssetStrings.splashImage,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.REGISTRATION,
                              arguments: {"isEdit": true});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              25.r,
                            ),
                            color: AppColors.errorColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.edit,
                              size: 15.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  currentUserInfo!.fullName!,
                  style: Get.theme.textTheme.headlineLarge!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      size: 12.h,
                      color: AppColors.blackColor.withOpacity(0.7),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      currentUserInfo!.phone!,
                      style: Get.theme.textTheme.headlineLarge!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.mail,
                      size: 12.h,
                      color: AppColors.blackColor.withOpacity(0.7),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      currentUserInfo!.email!,
                      style: Get.theme.textTheme.headlineLarge!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: currentUserInfo!.isVerify != null ||
                          currentUserInfo!.isVerify == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.verified,
                              color: Colors.green,
                              size: 20,
                            ),
                            Text(
                              "Verified",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                              size: 20,
                            ),
                            Text(
                              "Unverified",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                ),
                /*
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.w),
              child: Button(
                onPressed: () {},
                borderRadius: BorderRadius.circular(6.r),
                size: ButtonSize.small,
                fillColor: AppColors.errorColor,
                splashColor: AppColors.whiteDimColor,
                child: Text(
                  " LogOut ",
                  style: Get.theme.textTheme.bodySmall!
                      .copyWith(color: AppColors.whiteColor),
                ),
              ),
            ),
            */
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.statusbarcolor1,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            VechicleInfoBase(
                              title: "Vehicle Type",
                              subtitle: currentUserInfo!.vechicleCategory!,
                            ),
                            VechicleInfoBase(
                              title: "Vehicle No.",
                              subtitle: currentUserInfo!.vechicleNumber!,
                            ),
                            VechicleInfoBase(
                              title: "License No.",
                              subtitle: currentUserInfo!.licenseNumber!,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.whiteColor,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            VechicleInfoBase(
                              title: "Drive Experience",
                              subtitle: currentUserInfo!.licenseNumber!,
                            ),
                            VechicleInfoBase(
                              title: "Chasis No.",
                              subtitle: currentUserInfo!.licenseNumber!,
                            ),
                            VechicleInfoBase(
                              title: "BillBook No.",
                              subtitle: currentUserInfo!.licenseNumber!,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
