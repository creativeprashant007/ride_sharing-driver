import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';
import 'package:soundpool/soundpool.dart';

import '/utils/number_formatter.dart';
import '../app/widgets/components/common_widgets.dart';
import '../utils/asset_strings.dart';
import '../utils/memory_management.dart';

Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

bool isValidEmail({String? email}) {
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email!);
  return emailValid;
}

Future<bool> getRealDiviceStatus() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosInfo = await deviceInfoPlugin.iosInfo;
    if (iosInfo.isPhysicalDevice) {
      return true;
    }
  } else if (Platform.isAndroid) {
    var androidInfo = await deviceInfoPlugin.androidInfo;
    if (androidInfo.isPhysicalDevice) {
      return true;
    }
  }

  return false;
}

Future<void> playSound(
  Soundpool soundpool, {
  String source = AssetStrings.successAudio,
}) async {
  PerfectVolumeControl.hideUI = true;
  await PerfectVolumeControl.setVolume(1);

  try {
    await soundpool.loadAndPlay(
      await rootBundle.load(source),
    );
  } catch (e) {
    "".printError(info: e.toString());
  }
}

formatNumber({required String number}) {
  if (number.length < 3) {
    return number;
  }

  return NumberFormatter.formatter
      .format(int.parse(number.toString()))
      .split('.')
      .first;
}

String onDateLocaleChange({required String datetime}) {
  if (Get.locale!.countryCode == "EN") {
    return DateFormat('yyyy,MMM', "en").format(DateTime.parse(datetime));
  } else {
    return DateFormat.yMMM('ja').format(
      DateTime.parse(datetime),
    );
  }
}

calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  int month1 = currentDate.month;
  int month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}

setAuthenticationValuesInMemoryManagement({
  required String accessToken,
  required String loginToken,
  required String refreshToken,
  required String businessType,
  required bool loginStatus,
}) async {
  await MemoryManagement.setAccessToken(accessToken: accessToken);
  await MemoryManagement.setLoginToken(loginToken: loginToken);
  await MemoryManagement.setRefreshToken(refreshToken: refreshToken);
  await MemoryManagement.setLoginStatus(status: true);
  await MemoryManagement.setBusinessType(businessType: businessType);
}

String utcToLocal(date) {
  var parsedDate = DateTime.parse(date.toString());
  var utcDate = DateTime.utc(parsedDate.year, parsedDate.month, parsedDate.day,
      parsedDate.hour, parsedDate.minute, parsedDate.second);
  var dateTime = utcDate.toLocal().toString();

  return DateFormat('yyyy/MM/dd HH:mm:ss').format(DateTime.parse(dateTime));
}

String utcToLocalNoTime(date) {
  var parsedDate = DateTime.parse(date.toString());
  var dateTime = parsedDate.toLocal().toString();

  return DateFormat('yyyy/MM/dd').format(DateTime.parse(dateTime));
}

Image assetsImage({required String imagePath}) {
  return Image.asset(
    imagePath,
    fit: BoxFit.contain,
    repeat: ImageRepeat.noRepeat,
  );
}

callPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    errorMessage(message: "Location services are disabled.");
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      errorMessage(message: "Location permissions are denied");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    errorMessage(
        message:
            "Location permissions are permanently denied, we cannot request permissions.");
  }
}
