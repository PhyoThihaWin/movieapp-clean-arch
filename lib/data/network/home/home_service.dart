import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../api_constants.dart';

part 'home_service.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class HomeService {
  factory HomeService(Dio dio) = _HomeService;

  @GET(ENDPOINT_GET_POSTS)
  Future<String> getPosts();
}