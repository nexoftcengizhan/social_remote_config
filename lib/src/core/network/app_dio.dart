// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:social_remote_config/src/utils/constants/api_constants.dart';

class AppDio with DioMixin implements Dio {
  AppDio([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: options?.baseUrl ?? ApiConstants.baseUrl,
      contentType: ApiConstants.contentType,
      connectTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: ApiConstants.headers,
    );

    this.options = options;

    interceptors.addAll([
      PrettyDioLogger(
        logPrint: (object) {
          print(object);
        },
      ),
    ]);

    httpClientAdapter = DefaultHttpClientAdapter();
  }
}
