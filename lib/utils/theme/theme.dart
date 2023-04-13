//theme
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';

class AppTheme {
  static TextStyle headline1 = TextStyle(
    color: AppColors.blackColor,
    height: 48.0 / 36.0,
    // line height calculated as is fontSize * height so, <expected-height>/<font-size>
    fontSize: 36.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static TextStyle headline2Bold = TextStyle(
    color: AppColors.blackColor,
    height: 26.0 / 18.0,
    fontSize: 18.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static TextStyle heading2Regular = TextStyle(
    color: AppColors.blackColor,
    height: 26.0 / 18.0,
    fontSize: 18.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static TextStyle button = TextStyle(
    color: AppColors.whiteColor,
    height: 26.0 / 18.0,
    fontSize: 18.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static TextStyle captionBold = TextStyle(
    color: AppColors.blackColor,
    height: 22.0 / 16.0,
    fontSize: 16.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static TextStyle captionRegular = TextStyle(
    color: AppColors.blackColor,
    height: 20.0 / 16.0,
    fontSize: 16.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static TextStyle textBold = TextStyle(
    color: AppColors.blackColor,
    height: 20.0 / 14.0,
    fontSize: 14.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static TextStyle textRegular = TextStyle(
    color: AppColors.blackColor,
    height: 20.0 / 14.0,
    fontSize: 14.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static TextStyle subHeading = TextStyle(
    color: AppColors.blackColor,
    height: 28.0 / 12.0,
    fontSize: 12.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextStyle appBarTextStyle = TextStyle(
    color: AppColors.whiteColor,
    height: 29.0 / 20.0,
    fontSize: 20.sp,
    fontFamily: 'Noto Sans JP',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static TextStyle hintStyle = TextStyle(
    color: AppColors.hintColor.withOpacity(.6),
    height: 24.0 / 16.0,
    fontSize: 16.sp,
    fontFamily: 'Noto Sans JP',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static ThemeData get lightTheme {
    return ThemeData(
        primarySwatch: MaterialColorCustom.themeColor,
        fontFamily: 'Noto Sans JP',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline1: headline1,
          headline2: headline2Bold,
          headline3: heading2Regular,
          subtitle1: captionBold,
          subtitle2: captionRegular,
          bodyText1: textBold,
          bodyText2: textRegular,
          caption: subHeading,
          button: button,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          iconTheme: IconThemeData(color: AppColors.whiteColor),
          titleTextStyle: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: captionBold,
          hintStyle: hintStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColors.textBoxBorderColor,
              width: 1.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColors.textBoxBorderColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColors.textBoxBorderColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColors.textBoxBorderColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColors.errorColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColors.errorColor,
            ),
          ),
        ),
        
        tabBarTheme: TabBarTheme(
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: const EdgeInsets.symmetric(horizontal: 0),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(35.r),
              color: Colors.transparent,
            ),
            labelColor: Colors.white,
            labelStyle: textBold.copyWith(fontWeight: FontWeight.w700),
            unselectedLabelColor: AppColors.blackColor,
            unselectedLabelStyle: textBold.copyWith(
                fontWeight: FontWeight.w700, color: AppColors.whiteColor)));
  }

  static ThemeData get darkTheme {
    return lightTheme;
  }
}
