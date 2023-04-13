import 'dart:io';

import 'package:dio/dio.dart';
import 'package:driver/app/models/login/login_request_response.dart';

import '/app/network/api_s.dart';
import '/functions/universal_functions.dart';
import '/utils/memory_management.dart';

class Logging extends Interceptor {
  Dio dio;
  Logging({required this.dio});
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "Content-Type": "application/json",
      "device_type": Platform.isAndroid ? "1" : "2",
      "app_version": "1.0.0",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
    });
    if (MemoryManagement.getAccessToken() != null) {
      options.headers.addAll({
        "Authorization": "Bearer ${MemoryManagement.getLoginToken()}",
        "access-token": "Bearer ${MemoryManagement.getAccessToken()}"
      });
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // ignore: deprecated_member_use

      await refreshToken();
      try {
        handler.resolve(await _retry(err.requestOptions));
      } on DioError catch (e) {
        handler.next(e);
      }

      return;
    }

    handler.next(err);
  }

  Future<Response<dynamic>> refreshToken() async {
    var response = await dio.post(APIs.refreshToken,
        options: Options(
            headers: {"Refresh-Token": MemoryManagement.getRefreshToken()}));

    if (response.statusCode == 200) {
      LoginRequestResponse requestResponse =
          LoginRequestResponse.fromJson(response.data);

      await setAuthenticationValuesInMemoryManagement(
          accessToken: requestResponse.loginResponseMessage!.accessToken!,
          loginToken: requestResponse.loginResponseMessage!.loginToken!,
          refreshToken: requestResponse.loginResponseMessage!.refreshToken!,
          businessType: requestResponse.loginResponseMessage!.businessType!,
          loginStatus: true);
    }
    return response;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: {
        "Authorization": "Bearer ${MemoryManagement.getLoginToken()}",
        "access-token": "Bearer ${MemoryManagement.getAccessToken()}"
      },
    );

    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
