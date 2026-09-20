import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:ict_hub_flutter/app/app_router.dart';
import 'package:ict_hub_flutter/app/routes.dart';
import 'package:ict_hub_flutter/core/local_storage/base_local_storage.dart';

class AppInterceptors extends Interceptor {
  AppInterceptors({required this._sharedPrefs});

  final BaseLocalStorage _sharedPrefs;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyNTMyZGJlOS1iMGY2LTRjZTAtM2RkMC0wOGRmMTVkY2QxMGQiLCJqdGkiOiIyODk5OTgzNy03M2U0LTQ5ZTMtYTk3MC1lOWIwYmE1ZTA4ZGQiLCJlbWFpbCI6Imxva2EuYXNocmFmMjI0NEBnbWFpbC5jb20iLCJuYW1lIjoibG9rYSBhc2hyYWYiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3OTAxNDA1NTIsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.eEhDQyy4at4Dcv0xwQYN-hsPQg17V-_5IkFaHzVJSwY"; 
    await _sharedPrefs.getString("LocalKeys.accessToken");

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    if (kDebugMode) {
      log('REQUEST[${options.method}] => PATH: ${options.path}');
      log('Headers: ${options.headers}');
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (kDebugMode) {
      log(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
    }
    if (response.statusCode == 401 || response.statusCode == 302) {
      await _sharedPrefs.clear();
      navigatorKey.currentContext!.push(Routes.loginScreen);
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      log(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      );
      if (err.response?.data != null) {
        log('Error data: ${err.response?.data}');
      }
    }
    super.onError(err, handler);
  }
}
