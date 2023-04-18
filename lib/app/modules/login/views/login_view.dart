import 'package:driver/app/routes/app_pages.dart';
import 'package:driver/app/widgets/atoms/button_text.dart';
import 'package:driver/app/widgets/atoms/buttons.dart';
import 'package:driver/app/widgets/components/custom_field.dart';
import 'package:driver/functions/universal_functions.dart';
import 'package:driver/utils/asset_strings.dart';
import 'package:driver/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/molecules/empty_app_bar.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
                      height: 150.h,
                      width: Get.width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.w),
                        child: assetsImage(
                          imagePath: AssetStrings.splashImage,
                        ),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'SignIn As\n',
                            style: Get.theme.textTheme.headlineLarge!.copyWith(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.2.h,
                              color: AppColors.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: 'Driver',
                            style: Get.theme.textTheme.displayLarge!.copyWith(
                              color: AppColors.errorColor,
                            ),
                          ),
                          // TextSpan(
                          //   text: 'Booking',
                          //   style: Get.theme.textTheme.displayLarge!.copyWith(),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(() {
                      return controller.isEmailAuth.value
                          ? CustomField(
                              title: "Email",
                              isRequired: true,
                              validator: (value) =>
                                  controller.validateEmail(value),
                              controller: controller.emailController,
                              label: 'Email',
                            )
                          : CustomField(
                              title: "Mobile NO.",
                              inputType: TextInputType.phone,
                              isRequired: true,
                              validator: (value) =>
                                  controller.validatePhone(value),
                              controller: controller.phoneController,
                              label: '',
                            );
                    }),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomField(
                      title: "Password",
                      isRequired: true,
                      isObscureText: true,
                      validator: (value) => controller.validatePassword(value),
                      controller: controller.passwordController,
                      maxline: 1,
                      label: '',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Button(
                        onPressed: () {
                          controller.validateData();
                        },
                        borderRadius: BorderRadius.circular(8.r),
                        size: ButtonSize.medium,
                        fillColor: AppColors.errorColor,
                        splashColor: AppColors.whiteDimColor,
                        child: Text(
                          " SignIn ",
                          style: Get.theme.textTheme.labelLarge,
                        ),
                      ),
                    ),
                    ButtonText(
                      onPressEvent: () {
                        controller.onSwitchAuthType();
                      },
                      btnName: "SignIn By? ",
                      btnName1: "Phone",
                      style: Get.theme.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                      style1: Get.theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.errorColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'OR',
                        style: Get.theme.textTheme.bodySmall!.copyWith(
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    ButtonText(
                      onPressEvent: () {
                        Get.toNamed(
                          Routes.REGISTRATION,
                          arguments: {"isEdit": false},
                        );
                      },
                      btnName: "New user? ",
                      btnName1: "Create Account",
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
