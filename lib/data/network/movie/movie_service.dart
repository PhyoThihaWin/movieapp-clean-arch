import 'package:dio/dio.dart';
import 'package:movieapp_clean_arch/data/network/movie/response/movie_detail_credits_response.dart';
import 'package:movieapp_clean_arch/data/network/movie/response/movie_detail_response.dart';
import 'package:movieapp_clean_arch/data/network/movie/response/movie_response.dart';
import 'package:movieapp_clean_arch/data/network/movie/response/popular_person_response.dart';
import 'package:movieapp_clean_arch/data/network/utils/data_response.dart';
import 'package:retrofit/retrofit.dart';

import '../apiclient/api_constants.dart';

part 'movie_service.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class MovieApiService {
  factory MovieApiService(Dio dio) = _MovieApiService;

  @GET(ENDPOINT_GET_NOW_PLAYING)
  Future<DataResponse<List<MovieResponse>>> getNowPlayingMovies({
    @Query(PARAM_PAGE) int page = 1,
  });

  @GET(ENDPOINT_UP_COMING)
  Future<DataResponse<List<MovieResponse>>> getUpComingMovies({
    @Query(PARAM_PAGE) int page = 1,
  });

  @GET(ENDPOINT_POPULAR_MOVIES)
  Future<DataResponse<List<MovieResponse>>> getPopularMovies({
    @Query(PARAM_PAGE) int page = 1,
  });

  @GET(ENDPOINT_POPULAR_PERSON)
  Future<DataResponse<List<PopularPersonResponse>>> getPopularPerson();

  @GET(ENDPOINT_MOVIE_DETAIL)
  Future<MovieDetailResponse> getMovieDetail(@Path("id") int movieId);

  @GET(ENDPOINT_MOVIE_DETAIL_CREDITS)
  Future<MovieDetailCreditsResponse> getMovieDetailCredits(
      @Path("id") int movieId);
}
