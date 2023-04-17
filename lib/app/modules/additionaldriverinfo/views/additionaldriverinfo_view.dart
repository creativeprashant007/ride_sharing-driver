import 'package:driver/app/routes/app_pages.dart';
import 'package:driver/app/widgets/atoms/button_text.dart';
import 'package:driver/app/widgets/atoms/buttons.dart';
import 'package:driver/app/widgets/components/custom_field.dart';
import 'package:driver/app/widgets/molecules/empty_app_bar.dart';
import 'package:driver/utils/colors.dart';
import 'package:driver/utils/dropdown_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/additionaldriverinfo_controller.dart';

class AdditionaldriverinfoView extends GetView<AdditionaldriverinfoController> {
  const AdditionaldriverinfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
        appBar: const EmptyAppBar(statusBarColor: AppColors.statusbarcolor1),
        body: SingleChildScrollView(
          child: Container(
            height: Get.height * 1.h,
            decoration: const BoxDecoration(gradient: AppColors.gradient1),
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Add ',
                            style: Get.theme.textTheme.headlineLarge!.copyWith(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.2.h,
                              color: AppColors.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: 'Vehicle Info',
                            style: Get.theme.textTheme.displayLarge!.copyWith(
                              color: AppColors.errorColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomDropDownField(
                      title: "Vehicle Category",
                      isRequired: true,
                      label: "Select Option",
                      items: controller.vehicleType,
                      errorMessage: "Select vehicle",
                      validator: (value) {
                        return null;
                      },
                      onChanged: (DropdownType item) {
                        controller.vehicle = item.value!;
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomField(
                      title: "Vehicle number",
                      inputType: TextInputType.phone,
                      isRequired: true,
                      controller: controller.vehicleNumberController,
                      label: 'Vehicle number',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomField(
                      title: "Chasis number",
                      inputType: TextInputType.phone,
                      isRequired: true,
                      controller: controller.chasisNumberController,
                      label: 'Chasis number',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomField(
                      title: "BillBook number",
                      inputType: TextInputType.phone,
                      isRequired: true,
                      controller: controller.bilBookNumberController,
                      label: 'BillBook number',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomField(
                      title: "License number",
                      inputType: TextInputType.phone,
                      isRequired: true,
                      controller: controller.licenseNumberController,
                      label: 'License number',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomField(
                      title: "Driver experience",
                      inputType: TextInputType.phone,
                      isRequired: true,
                      controller: controller.driverExperController,
                      label: 'Driver experience',
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Button(
                      onPressed: () {
                        controller.validateData();
                      },
                      borderRadius: BorderRadius.circular(8.r),
                      size: ButtonSize.medium,
                      fillColor: AppColors.errorColor,
                      splashColor: AppColors.whiteDimColor,
                      child: Text(
                        "Signup",
                        style: Get.theme.textTheme.labelLarge,
                      ),
                    ),
                    ButtonText(
                      onPressEvent: () {
                        Get.offAndToNamed(Routes.LOGIN);
                      },
                      btnName: "Already have an account? ",
                      btnName1: "Login",
                      style: Get.theme.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                      style1: Get.theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.errorColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
