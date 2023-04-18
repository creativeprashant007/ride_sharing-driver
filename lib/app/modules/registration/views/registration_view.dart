import 'package:driver/app/widgets/atoms/button_text.dart';
import 'package:driver/app/widgets/atoms/buttons.dart';
import 'package:driver/app/widgets/components/custom_field.dart';
import 'package:driver/app/widgets/molecules/empty_app_bar.dart';
import 'package:driver/utils/colors.dart';
import 'package:driver/utils/dropdown_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
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
                            text:
                                controller.isEdit ? "Update\n" : 'SignUP As\n',
                            style: Get.theme.textTheme.headlineLarge!.copyWith(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.2.h,
                              color: AppColors.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: controller.isEdit ? 'Driver Info' : 'Driver',
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
                    CustomField(
                      title: "Username",
                      isRequired: true,
                      validator: (value) => controller.validateUsername(value),
                      controller: controller.usernameController,
                      label: 'Username',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomField(
                      title: "Email",
                      isRequired: true,
                      validator: (value) => controller.validateEmail(value),
                      controller: controller.emailController,
                      label: 'Email',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomField(
                      title: "Mobile NO.",
                      inputType: TextInputType.phone,
                      isRequired: true,
                      validator: (value) => controller.validatePhone(value),
                      controller: controller.phoneController,
                      label: 'Mobile No.',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    controller.isEdit
                        ? const SizedBox()
                        : CustomDropDownField(
                            title: "Gender",
                            isRequired: true,
                            label: "Select Option",
                            items: controller.genderType,
                            errorMessage: "Select gender",
                            onChanged: (DropdownType item) {
                              controller.gender = item.value!;
                            },
                          ),
                    SizedBox(
                      height: 10.h,
                    ),
                    controller.isEdit
                        ? const SizedBox()
                        : CustomField(
                            title: "Password",
                            isRequired: true,
                            isObscureText: true,
                            validator: (value) =>
                                controller.validatePassword(value),
                            controller: controller.passwordController,
                            maxline: 1,
                            label: 'Password',
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
                        "Next",
                        style: Get.theme.textTheme.labelLarge,
                      ),
                    ),
                    controller.isEdit
                        ? ButtonText(
                            onPressEvent: () {
                              Get.back();
                            },
                            btnName: "Go",
                            btnName1: "Back",
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                            style1: Get.theme.textTheme.bodyMedium!.copyWith(
                                color: AppColors.errorColor,
                                fontWeight: FontWeight.w600),
                          )
                        : ButtonText(
                            onPressEvent: () {
                              Get.back();
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
