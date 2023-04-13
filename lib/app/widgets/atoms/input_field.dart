import 'package:flutter/material.dart'
    show
        BuildContext,
        FontWeight,
        Row,
        SizedBox,
        StatelessWidget,
        Text,
        Widget,
        Wrap;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/utils/colors.dart' show AppColors;

class InputField extends StatelessWidget {
  final Widget child;
  final String? label;
  final bool? required;
  const InputField({
    super.key,
    required this.child,
    this.label,
    this.required,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8.h,
      spacing: 2.w,
      children: [
        if (label != null)
          Row(
            children: [
              Text(
                label ?? '',
                style: Get.textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              if (required == true)
                Text(
                  "*",
                  style: Get.theme.textTheme.bodyText2!.copyWith(
                    color: AppColors.errorColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
        child,
      ],
    );
  }
}
