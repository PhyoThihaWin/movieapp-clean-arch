import 'package:chuck_interceptor/chuck.dart';
import 'package:dio/dio.dart';
import 'package:movieapp_clean_arch/data/network/apiclient/auth_token_interceptor.dart';
import 'package:movieapp_clean_arch/page/nav_host/nav_host_helper.dart';

class DioClient {
  static Dio? dio;
  static Chuck chuck = Chuck(
      showNotification: true, navigatorKey: NavHostHelper.parentNavigatorKey);

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = const Duration(seconds: 20);

      dio!.interceptors.addAll([
        AuthTokenInterceptor(),
        LogInterceptor(responseHeader: false),
        chuck.getDioInterceptor()
      ]);
    }
    return dio!;
  }
}
