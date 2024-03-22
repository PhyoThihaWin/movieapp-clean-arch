import 'package:dio/dio.dart';
import 'package:movieapp_clean_arch/data/cache/home/daos/actor_dao.dart';
import 'package:movieapp_clean_arch/data/cache/home/daos/movie_dao.dart';
import 'package:movieapp_clean_arch/data/network/home/response/movie_response.dart';
import 'package:movieapp_clean_arch/domain/entities/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';
import 'package:movieapp_clean_arch/domain/repository/home/home_repository.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';
import 'package:stream_transform/stream_transform.dart';

import '../cache/home/mapper/actor_entity_mapper.dart';
import '../cache/home/mapper/actor_vo_mapper.dart';
import '../cache/home/mapper/movie_vo_mapper.dart';
import '../cache/home/mapper/movie_entity_mapper.dart';
import '../network/home/home_service.dart';
import '../network/home/mapper/now_playing_movies_mapper.dart';
import '../network/home/mapper/popular_person_mapper.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeService homeService;
  final MovieDao movieDao;
  final ActorDao actorDao;
  final NowPlayingMoviesMapper movieMapper;
  final PopularPersonMapper personMapper;

  final MovieVoMapper movieVoMapper;
  final MovieEntityMapper movieEntityMapper;

  final ActorEntityMapper actorEntityMapper;
  final ActorVoMapper actorVoMapper;

  HomeRepositoryImpl(
      this.homeService,
      this.movieDao,
      this.actorDao,
      this.movieMapper,
      this.personMapper,
      this.movieVoMapper,
      this.movieEntityMapper,
      this.actorEntityMapper,
      this.actorVoMapper);

  @override
  getNowPlayingMovies() {
    var raw = homeService.getNowPlayingMovies();
    raw.then((value) {
      var data = (value.data?.map((e) => movieMapper.map(e))).orEmpty;
      movieDao.saveAllMovie(data.map(
        (e) {
          var entity = movieEntityMapper.map(e);
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
          var entity = movieEntityMapper.map(e);
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
          var entity = movieEntityMapper.map(e);
          entity.isNowPlaying = false;
          entity.isComingSoon = false;
          entity.isPopular = true;
          return entity;
        },
      ).toList());
    });
  }

  @override
  getPopularPerson() {
    var raw = homeService.getPopularPerson();
    return raw.then(
      (value) {
        var data = (value.data?.map((e) => personMapper.map(e))).orEmpty;
        actorDao
            .saveAllActors(data.map((e) => actorEntityMapper.map(e)).toList());
      },
    );
  }

  @override
  Stream<List<MovieVo>> getDbNowPlayingMovies() {
    getNowPlayingMovies();
    return movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getPopularMovies())
        .map((event) => movieDao
            .getNowPlayingMovies()
            .map((e) => movieVoMapper.map(e))
            .toList());
  }

  @override
  Stream<List<MovieVo>> getDbPopularMovies() {
    getPopularMovies();
    return movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getPopularMovies())
        .map((event) => movieDao
            .getPopularMovies()
            .map((e) => movieVoMapper.map(e))
            .toList());
  }

  @override
  Stream<List<MovieVo>> getDbUpComingMovies() {
    getUpComingMovies();
    return movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getUpComingMovies())
        .map((event) => movieDao
            .getUpComingMovies()
            .map((e) => movieVoMapper.map(e))
            .toList());
  }

  @override
  Stream<List<ActorVo>> getDbPopularPerson() {
    getPopularPerson();
    return actorDao
        .getAllActorsEventStream()
        .startWith(actorDao.getActors())
        .map((event) =>
            actorDao.getActors().map((e) => actorVoMapper.map(e)).toList());
  }
}
