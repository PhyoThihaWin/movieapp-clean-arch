import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:movieapp_clean_arch/data/network/auth_token_interceptor.dart';

class DioClient {
  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = const Duration(seconds: 20);

      dio!.interceptors.addAll([
        AuthTokenInterceptor(),
        LogInterceptor(),
        ChuckerDioInterceptor(),
      ]);

      ChuckerFlutter.showNotification = true;
    }
    return dio!;
  }
}
