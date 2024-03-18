import 'package:dio/dio.dart';
import 'package:movieapp_clean_arch/data/network/home/response/movie_response.dart';
import 'package:movieapp_clean_arch/data/network/utils/data_response.dart';
import 'package:retrofit/http.dart';

import '../api_constants.dart';

part 'home_service.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class HomeService {
  factory HomeService(Dio dio) = _HomeService;

  @GET(ENDPOINT_GET_NOW_PLAYING)
  Future<DataResponse<List<MovieResponse>>> getNowPlayingMovies();

  @GET(ENDPOINT_UP_COMING)
  Future<DataResponse<List<MovieResponse>>> getUpComingMovies();
}
