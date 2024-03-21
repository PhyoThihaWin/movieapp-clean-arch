import 'package:chuck_interceptor/chuck.dart';
import 'package:dio/dio.dart';
import 'package:movieapp_clean_arch/data/network/apiclient/auth_token_interceptor.dart';

class DioClient {
  static Dio? dio;
  static Chuck chuck = Chuck(
    showNotification: true,
  );

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = const Duration(seconds: 20);

      dio!.interceptors.addAll([
        AuthTokenInterceptor(),
        LogInterceptor(),
        chuck.getDioInterceptor()
      ]);
    }
    return dio!;
  }
}
