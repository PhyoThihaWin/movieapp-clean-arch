import 'package:dio/dio.dart';
import 'package:movieapp_clean_arch/data/cache/home/daos/movie_dao.dart';
import 'package:movieapp_clean_arch/data/network/home/response/movie_response.dart';
import 'package:movieapp_clean_arch/domain/entities/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';
import 'package:movieapp_clean_arch/domain/repository/home/home_repository.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';

import '../cache/home/mapper/movie_entity_mapper.dart';
import '../cache/home/mapper/movie_vo_mapper.dart';
import '../network/home/home_service.dart';
import '../network/home/mapper/now_playing_movies_mapper.dart';
import '../network/home/mapper/popular_person_mapper.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeService homeService;
  final MovieDao movieDao;
  final NowPlayingMoviesMapper movieMapper;
  final PopularPersonMapper personMapper;

  final MovieEntityMapper movieEntityMapper;
  final MovieVoMapper movieVoMapper;

  HomeRepositoryImpl(this.homeService, this.movieDao, this.movieMapper,
      this.personMapper, this.movieEntityMapper, this.movieVoMapper);

  @override
  getNowPlayingMovies() {
    var raw = homeService.getNowPlayingMovies();
    raw.then((value) {
      var data = (value.data?.map((e) => movieMapper.map(e))).orEmpty;
      movieDao.saveAllMovie(data.map(
        (e) {
          var entity = movieVoMapper.map(e);
          entity.isNowPlaying = true;
          entity.isComingSoon = false;
          entity.isPopular = false;
          return entity;
        },
      ).toList());
    });
  }

  @override
  getUpComingMovies() {
    var raw = homeService.getUpComingMovies();
    raw.then((value) {
      var data = (value.data?.map((e) => movieMapper.map(e))).orEmpty;
      movieDao.saveAllMovie(data.map(
            (e) {
          var entity = movieVoMapper.map(e);
          entity.isNowPlaying = false;
          entity.isComingSoon = true;
          entity.isPopular = false;
          return entity;
        },
      ).toList());
    });
  }

  @override
  getPopularMovies() {
    var raw = homeService.getPopularMovies();
    raw.then((value) {
      var data = (value.data?.map((e) => movieMapper.map(e))).orEmpty;
      movieDao.saveAllMovie(data.map(
            (e) {
          var entity = movieVoMapper.map(e);
          entity.isNowPlaying = false;
          entity.isComingSoon = false;
          entity.isPopular = true;
          return entity;
        },
      ).toList());
    });
  }

  @override
  Future<List<ActorVo>> getPopularPerson() {
    var raw = homeService.getPopularPerson();
    return raw
        .then((value) => (value.data?.map((e) => personMapper.map(e))).orEmpty);
  }

  @override
  Stream<List<MovieVo>> getDbNowPlayingMovies() {
    getNowPlayingMovies();
    return movieDao
        .getNowPlayingMovies()
        .map((event) => event.map((e) => movieEntityMapper.map(e)).toList());
  }

  @override
  Stream<List<MovieVo>> getDbPopularMovies() {
    getPopularMovies();
    return movieDao
        .getPopularMovies()
        .map((event) => event.map((e) => movieEntityMapper.map(e)).toList());
  }

  @override
  Stream<List<MovieVo>> getDbUpComingMovies() {
    getUpComingMovies();
    return movieDao
        .getUpComingMovies()
        .map((event) => event.map((e) => movieEntityMapper.map(e)).toList());
  }
}
