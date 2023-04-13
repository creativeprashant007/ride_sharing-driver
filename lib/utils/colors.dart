import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color primaryColor = Color(0xFF388059);
  static const Color primaryDisableColor = Color(0xFF6D927E);
  static const Color fadedPrimaryColor = Color(0xFFE7F7EE);
  static const Color secondaryColor = Color(0xFFCA4903);
  static const Color fadedOrangeColor = Color(0xFFFFE9DD);
  static const Color disablePrimaryColor = Color(0xFF6D927E);

  static const Color whiteDimColor = Color(0xFFfbfbfb);

  static const Color orangeColor = Color(0xFFF58344);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color lineColor = Color(0xFFEDEDED);

  static const Color greyColor = Color(0xFFD9D9D9);
  static const Color greenColor = Color(0xFF05BD22);
  static const Color redColor = Color(0xFFDE0F0F);
  static const Color darkRed = Color(0xFFA3260B);
  static const Color greyDividerColor = Color(0xFFE3E3E3);
  static const Color offWhite = Color(0xFFF5F5F5);
  static const Color borderColor = Color(0xFFC4C4C4);
  static const Color fillColor = Color(0xFFF1F1F1);
  static const Color boxFillColor = Color(0xFFF9F9F9);

  static const Color backgroundColor1 = Color(0x00fff6f1);
  static const Color backgroundColor2 = Color(0x0e8e8e81);
  static const Color textBoxColor = Color(0xFFfbfbfb);
  static const Color successColor = Color(0xFF388059);
  static const Color errorColor = Color(0xFFF04242);
  static const Color fontColor = Color(0xFF000000);
  static const Color textBoxBorderColor = Color.fromRGBO(196, 196, 196, 1);
  static const Color secondaryColor1 = Color.fromARGB(0, 19, 7, 0);
  static const Color backgroundColor3 = Color(0x00EFF3F1);
  static const Color backgroundColor4 = Color(0x009C9C9C);
  static const Color borderColor1 = Color(0x00CCC8C8);
  static const Color buttonColor = Color(0x006D927E);
  static const Color hintColor = Color(0xff263238);
  static const Color tableBorder = Color(0xffACA8A8);
  static const Color shadowColor = Color(0xFFE8E8E8);
  static const Color darkTextColor = Color.fromRGBO(92, 92, 92, 1);
  static const Color statusbarcolor = Color.fromARGB(255, 206, 249, 255);
  static const Color statusbarcolor1 = Color.fromARGB(255, 219, 184, 216);

  // static const Color orangeColor = Color.fromARGB(255, 126, 123, 122);
  static const Color tileIconBackgroundColor = Color(0xFFEEF3F1);

  static const appBoxShadow = [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 5.0,
      spreadRadius: 0.5,
      offset: Offset(0.7, 0.7),
    ),
  ];

  static const LinearGradient gradientBackgroundColor = LinearGradient(colors: [
    Color(0xFFFFF1E9),
    Color(0xFFFFF6F1),
    Color(0xFFFFFFFF),
  ], stops: [
    0.0,
    0.1,
    1.0
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static const LinearGradient gradientBackgroundColor2 =
      LinearGradient(colors: [
    Color(0xFFFFF1E9),
    Color(0xFFFFF6F1),
    Color(0xFFFFFFFF),
  ], stops: [
    0.01,
    0.41,
    1.0
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static const LinearGradient gradientBackgroundColor3 =
      LinearGradient(colors: [
    Color(0xFFFFF6F1),
    Color(0xFFFFFFFF),
    Color(0xFFFFF6F1),
  ], stops: [
    0.01,
    0.41,
    1.0
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static const LinearGradient residetGradientBackgroundColor =
      LinearGradient(colors: [
    Color(0xFFFFF6F1),
    Color(0xFFFFFFFF),
    Color(0xFFE8E8E8),
  ], stops: [
    0.01,
    0.4167,
    1.0
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const LinearGradient gradient1 = LinearGradient(colors: [
    Color.fromARGB(255, 230, 205, 228),
    Color.fromARGB(255, 218, 213, 217),
    Color.fromARGB(255, 234, 255, 251),
  ], stops: [
    0.01,
    0.4167,
    1.0
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const LinearGradient gradient2 = LinearGradient(colors: [
    Color.fromARGB(255, 221, 255, 248),
    Color.fromARGB(255, 222, 251, 255),
    Color.fromARGB(255, 237, 253, 250),
  ], stops: [
    0.01,
    0.4167,
    1.0
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
}

class MaterialColorCustom {
  static const int _themeColor = 0xFFFF388059;
  static MaterialColor themeColor = const MaterialColor(
    _themeColor,
    <int, Color>{
      50: Color(0xFF0054A6),
      100: Color(0xFF0054A6),
      200: Color(0xFF0054A6),
      300: Color(0xFF0054A6),
      400: Color(0xFF0054A6),
      500: Color(_themeColor),
      600: Color(0xFF0054A6),
      700: Color(0xFF0054A6),
      800: Color(0xFF0054A6),
      900: Color(0xFF0054A6),
    },
  );
}
/*
background: linear-gradient(180deg, #FFF6F1 0.01%, #FFFFFF 41.67%, #E8E8E8 100%);


*/

