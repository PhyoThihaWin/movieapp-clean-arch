import 'package:dart_extensions/dart_extensions.dart';
import 'package:dio/dio.dart';

class AuthTokenInterceptor extends InterceptorsWrapper {
  final token =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YjgzYjQ1NTVlZWE3OTgwYTVhMmM5ODE0Y2RiMWJjMSIsInN1YiI6IjY0MDAxZTU0Njk5ZmI3MDBjNjRhYTBhNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ds757UkPK8y4EAO1RL_0vG_70X77nt8lenLL0t_Yy1E";

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll({
      'Authorization': 'Bearer ${(token.orEmpty)}',
      'Accept': 'application/json',
      'content-type': 'application/json',
    });
    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
