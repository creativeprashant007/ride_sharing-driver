import 'dart:async';

import 'package:dio/dio.dart';

import '../../config/config.dart';
import '../../global_constants/global_constants.dart';
import '../../utils/messages.dart';
import '../models/error/api_error.dart';
import 'interceptor.dart';

enum MethodType { POST, GET, PUT, DELETE }

const Duration timeoutDuration = Duration(seconds: 60);

class APIHandler {
  static initDio() {
    dio = Dio(BaseOptions(baseUrl: Config.apiUrl));
    dio.interceptors.add(Logging(dio: dio));
  }
  // POST method

  // Generic HTTP method
  static Future<dynamic> hitApi(Future<Response<dynamic>> response) async {
    Completer<dynamic> completer = Completer<dynamic>();
    try {
      var res = await response;
      completer.complete(res.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 403) {
        APIError apiError = APIError(
          error: parseError(e.response!.data),
          status: 403,
          onAlertPop: () {},
        );
        completer.complete(apiError);
      } else if (e.response?.statusCode == 400) {
        APIError apiError = APIError(
          error: parseError(e.response!.data),
          message: e.response!.data,
          status: 400,
        );
        completer.complete(apiError);
      } else if (e.response?.statusCode == 401) {
        APIError apiError = APIError(
          error: parseError(e.response!.data),
          status: 401,
        );
        completer.complete(apiError);
      } else {
        APIError apiError;
        if (!internetstatus) {
          apiError = APIError(
              error: "no_internet_connection",
              message: "no_internet_connection",
              status: e.response?.statusCode ?? 0);
        } else {
          apiError = APIError(
              error: parseError(e.response?.data ?? ""),
              message: e.response?.data ?? "",
              status: e.response?.statusCode ?? 0);
        }
        completer.complete(apiError);
      }
    } catch (e) {
      APIError apiError = APIError(error: Messages.genericError, status: 500);
      completer.complete(apiError);
    }
    return completer.future;
  }

  static String parseError(dynamic response) {
    try {
      var error = response["error"];
      if (error == null) {
        return error;
      }
      return error['message'];
    } catch (e) {
      return Messages.genericError;
    }
  }

  static String parseErrorMessage(dynamic response) {
    try {
      return response["message"];
    } catch (e) {
      return Messages.genericError;
    }
  }
}
