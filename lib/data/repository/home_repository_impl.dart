import 'package:dio/dio.dart';
import 'package:movieapp_clean_arch/data/network/home/response/movie_response.dart';
import 'package:movieapp_clean_arch/domain/entities/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';
import 'package:movieapp_clean_arch/domain/repository/home/home_repository.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';

import '../network/home/home_service.dart';
import '../network/home/mapper/now_playing_movies_mapper.dart';
import '../network/home/mapper/popular_person_mapper.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeService homeService;
  final NowPlayingMoviesMapper movieMapper;
  final PopularPersonMapper personMapper;

  HomeRepositoryImpl(this.homeService, this.movieMapper, this.personMapper);

  @override
  Future<List<MovieVo>> getNowPlayingMovies() {
    var raw = homeService.getNowPlayingMovies();
    return raw
        .asStream()
        .map((event) => (event.data?.map((e) => movieMapper.map(e))).orEmpty)
        .first;
  }

  @override
  Future<List<MovieVo>> getUpComingMovies() {
    var raw = homeService.getUpComingMovies();
    return raw
        .then((value) => (value.data?.map((e) => movieMapper.map(e))).orEmpty);
  }

  @override
  Future<List<MovieVo>> getPopularMovies() {
    var raw = homeService.getPopularMovies();
    return raw
        .then((value) => (value.data?.map((e) => movieMapper.map(e))).orEmpty);
  }

  @override
  Future<List<ActorVo>> getPopularPerson() {
    var raw = homeService.getPopularPerson();
    return raw
        .then((value) => (value.data?.map((e) => personMapper.map(e))).orEmpty);
  }
}
