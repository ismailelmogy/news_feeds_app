import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppIntercepters extends Interceptor {
  // final LangLocalDataSource langLocalDataSource;
  // final AuthLocalDataSource authLocalDataSource;
  // AppIntercepters(
  //     {required this.langLocalDataSource, required this.authLocalDataSource});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[HttpHeaders.acceptHeader] = ContentType.json;
    // String lang = await langLocalDataSource.getSavedLang();
    // options.headers[HttpHeaders.acceptLanguageHeader] = lang;
    // UserModel? authenticatedUser =
    //     await authLocalDataSource.getSavedLoginCredentials();
    // if (authenticatedUser != null) {
    //   options.headers[HttpHeaders.authorizationHeader] =
    //       AppStrings.bearer + authenticatedUser.accessToken!;
    // }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
