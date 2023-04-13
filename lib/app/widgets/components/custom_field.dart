import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '/app/widgets/atoms/input_field.dart';
import '/utils/dropdown_type.dart';
import '../../../utils/asset_strings.dart';
import '../../../utils/colors.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final Function? validator;
  final Function? onChanged;
  final String label;
  final VoidCallback? suffixIconCallback;
  final String? title;
  final String? counterText;
  final int? maxline;
  final List<TextInputFormatter>? inputFormatters;
  final bool isObscureText;
  final bool isHaveSuffixIcon;
  final bool isRequired;
  final bool readOnly;
  final bool isTextAlignCenter;
  final TextInputType inputType;
  final int? maxLength;
  const CustomField(
      {Key? key,
      required this.controller,
      this.inputFormatters,
      this.validator,
      this.isTextAlignCenter = false,
      this.suffixIconCallback,
      this.maxLength,
      this.counterText,
      this.readOnly = false,
      this.maxline = 1,
      this.title,
      this.inputType = TextInputType.text,
      this.isObscureText = false,
      this.isRequired = false,
      this.isHaveSuffixIcon = false,
      required this.label,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputField(
        label: title,
        required: isRequired,
        child: Container(
          //  height: 50.h,
          child: TextFormField(
              inputFormatters: inputFormatters,
              maxLength: maxLength,
              maxLines: maxline,
              readOnly: readOnly,
              obscureText: isObscureText,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorColor: AppColors.blackColor,
              validator: (value) =>
                  validator != null ? validator!(value) : null,
              controller: controller,
              textAlign: isTextAlignCenter ? TextAlign.center : TextAlign.left,
              keyboardType: maxline == 1 ? inputType : null,
              style: ThemeData().textTheme.headlineMedium,
              onChanged: (value) =>
                  onChanged != null ? onChanged!(value) : null,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                  counterText: counterText,
                  fillColor:
                      readOnly ? AppColors.borderColor : AppColors.textBoxColor,
                  filled: true,
                  hintText: label,
                  suffixIcon: isHaveSuffixIcon
                      ? IconButton(
                          onPressed: () {
                            suffixIconCallback!();
                          },
                          icon: isObscureText
                              ? SvgPicture.asset(
                                  AssetStrings.eyeClosed,
                                  height: 15.95.h,
                                  width: 13.5.w,
                                )
                              : SvgPicture.asset(
                                  AssetStrings.eyeOpened,
                                  height: 15.95.h,
                                  width: 13.5.w,
                                ),
                        )
                      : null)),
        ));
  }
}

class CustomDropDownField<T> extends StatelessWidget {
  final Function? validator;
  String dropDownKey;
  final Function? onChanged;
  final Function? onSaved;
  final String? title;
  final String label;
  final String additionItemsText;
  final String? errorMessage;
  final VoidCallback? suffixIconCallback;
  final int? maxline;
  final bool isObscureText;
  final bool isHaveSuffixIcon;
  final bool isRequired;
  final TextInputType inputType;
  final int? maxLength;
  final List<DropdownType>? items;
  final TextEditingController? controller;
  CustomDropDownField({
    Key? key,
    this.validator,
    this.additionItemsText = "",
    this.errorMessage,
    this.suffixIconCallback,
    this.maxLength,
    this.maxline = 1,
    this.title,
    required this.items,
    this.inputType = TextInputType.text,
    this.isObscureText = false,
    this.isRequired = false,
    this.isHaveSuffixIcon = false,
    required this.label,
    this.onChanged,
    this.onSaved,
    this.controller,
    this.dropDownKey = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputField(
        required: isRequired,
        label: title!,
        child: DropdownButtonFormField2(
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 0, vertical: 8.0.h),
            isDense: true,
            fillColor: AppColors.backgroundColor,
            filled: true,
          ),
          dropdownElevation: 0,
          isExpanded: true,
          buttonHeight: 30.h,
          dropdownPadding: EdgeInsets.zero,

          hint: Padding(
            padding: EdgeInsets.only(left: 13.4.h),
            child: Text(label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.blackColor.withOpacity(0.6),
                )),
          ),
          icon: Padding(
              padding: EdgeInsets.only(right: 13.4.h),
              child: const Icon(Icons.arrow_drop_down)),
          dropdownDecoration: BoxDecoration(
            border: Border.all(
              color: AppColors.backgroundColor4,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.backgroundColor4,
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          items: items!.map((DropdownType item) {
            return DropdownMenuItem<DropdownType>(
              value: item,
              child: Container(
                color: AppColors.backgroundColor4,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: Padding(
                  padding: EdgeInsets.only(left: 13.4.h),
                  child: Text(
                    item.key!,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            );
          }).toList(),
          validator: (DropdownType? item) {
            // if (item == null) {
            //   return errorMessage;
            // }
            return null;
          },
          onChanged: (DropdownType? value) {
            onChanged != null ? onChanged!(value) : null;
          },
          onSaved: (DropdownType? value) {
            onSaved != null ? onSaved!(value) : null;
          },
          selectedItemBuilder: (context) {
            return items!
                .map(
                  (item) => Padding(
                    padding: EdgeInsets.only(left: 13.4.h),
                    child: Text(
                      item.key!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                )
                .toList();
          },
          itemPadding: EdgeInsets.zero,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          // style: ThemeData().textTheme.headline4,
        ));
  }
}
