import 'package:dio/dio.dart';

class DioClient {
  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = const Duration(seconds: 20);
      // dio!.interceptors.add(ApiInterceptors());
    }
    return dio!;
  }
}
