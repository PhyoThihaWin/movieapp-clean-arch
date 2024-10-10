import 'package:dio/dio.dart';
import 'package:movieapp_clean_arch/data/network/movie/movie_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'apiclient/dio_client.dart';

part 'network_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return DioClient.getDio();
}

@riverpod
MovieApiService movieApiService(MovieApiServiceRef ref) {
  return MovieApiService(ref.read(dioProvider));
}
