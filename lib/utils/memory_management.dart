import 'package:shared_preferences/shared_preferences.dart';

import 'shared_peferences_keys.dart';

class MemoryManagement {
  static SharedPreferences? prefs;

  static Future<bool> init() async {
    prefs = await SharedPreferences.getInstance();
    return true;
  }

  // static void setUserDetail({required UserDetails? userDetails}) {
  //   prefs!.setString(SharedPrefsKeys.USER_DETAILS, jsonEncode(userDetails));
  // }

  // static UserDetails getUserDetail() {
  //   final idToken =
  //       parseIdToken(prefs!.getString(SharedPrefsKeys.USER_DETAILS)!);
  //   var parsedData = json.encode(idToken);
  //   return UserDetails.fromJson(jsonDecode(parsedData));
  // }

  static setAccessToken({required String accessToken}) async {
    return await prefs!.setString(SharedPrefsKeys.accessToken, accessToken);
  }

  static void removeAccessToken() {
    prefs!.remove(SharedPrefsKeys.accessToken);
  }

  static String? getAccessToken() {
    return prefs != null ? prefs!.getString(SharedPrefsKeys.accessToken) : null;
  }

  static setRefreshToken({required String refreshToken}) async {
    return await prefs!.setString(SharedPrefsKeys.refreshToken, refreshToken);
  }

  static String getRefreshToken() {
    return prefs!.getString(SharedPrefsKeys.refreshToken)!;
  }

  static setLoginToken({required String loginToken}) async {
    return await prefs!.setString(SharedPrefsKeys.loginToken, loginToken);
  }

  static String getLoginToken() {
    return prefs!.getString(SharedPrefsKeys.loginToken)!;
  }

  static setLoginStatus({required bool status}) {
    return prefs!.setBool(SharedPrefsKeys.loginStatus, status);
  }

  static bool getLoginStatus() {
    return prefs!.getBool(SharedPrefsKeys.loginStatus)!;
  }

  static setBusinessType({required String businessType}) {
    return prefs!.setString(SharedPrefsKeys.businessType, businessType);
  }

  static String getBusinessType() {
    return prefs!.getString(SharedPrefsKeys.businessType)!;
  }

  static void setUserType({required String userType}) {
    prefs!.setString(SharedPrefsKeys.userType, userType);
  }

  static void removeUserType() {
    prefs!.remove(SharedPrefsKeys.userType);
  }

  static String? getUserType() {
    return prefs != null ? prefs!.getString(SharedPrefsKeys.userType) : null;
  }

  static void setFirebaseToken({required String? firebaseToken}) {
    prefs!.setString(SharedPrefsKeys.firebaseToken, firebaseToken!);
  }

  static String getFirebaseToken() {
    return prefs!.getString(SharedPrefsKeys.firebaseToken)!;
  }

  static void setUserInfo({required String userInfo}) {
    prefs!.setString(SharedPrefsKeys.userInfo, userInfo);
  }

  static String getUserInfo() {
    return prefs!.getString(SharedPrefsKeys.userInfo)!;
  }

  static void clearMemory() async {
    await prefs!.clear();
  }
}
