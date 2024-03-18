import 'package:dio/dio.dart';
import 'package:movieapp_clean_arch/data/network/home/response/movie_response.dart';
import 'package:movieapp_clean_arch/domain/entities/MovieVo.dart';
import 'package:movieapp_clean_arch/domain/repository/home/home_repository.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';

import '../network/home/home_service.dart';
import '../network/home/mapper/now_playing_movies_mapper.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeService homeService;
  final NowPlayingMoviesMapper mapper;

  HomeRepositoryImpl(this.homeService, this.mapper);

  @override
  Future<List<MovieVo>> getNowPlayingMovies() {
    var raw = homeService.getNowPlayingMovies();
    return raw
        .asStream()
        .map((event) => (event.data?.map((e) => mapper.map(e))).orEmpty)
        .first;
  }
}
