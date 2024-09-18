import 'package:dart_extensions/dart_extensions.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/actor_dao.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/movie_dao.dart';
import 'package:movieapp_clean_arch/domain/models/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';
import 'package:movieapp_clean_arch/domain/repository/home/movie_repository.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../domain/models/movie_detail_vo.dart';
import '../cache/hive/mapper/actor_entity_mapper.dart';
import '../cache/hive/mapper/actor_vo_mapper.dart';
import '../cache/hive/mapper/movie_entity_mapper.dart';
import '../cache/hive/mapper/movie_vo_mapper.dart';
import '../network/movie/mapper/now_playing_movies_mapper.dart';
import '../network/movie/mapper/popular_person_mapper.dart';
import '../network/movie/movie_service.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieApiService movieApiService;
  final MovieDao movieDao;
  final ActorDao actorDao;

  final NowPlayingMoviesMapper movieMapper;
  final PopularPersonMapper personMapper;

  final MovieVoMapper movieVoMapper;
  final MovieEntityMapper movieEntityMapper;

  final ActorEntityMapper actorEntityMapper;
  final ActorVoMapper actorVoMapper;

  MovieRepositoryImpl(
      this.movieApiService,
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
    var raw = movieApiService.getNowPlayingMovies();
    raw.then((value) {
      var data = IterableNullSafetyExtension(
          value.data?.map((e) => movieMapper.map(e))).orEmpty();
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
    var raw = movieApiService.getUpComingMovies();
    raw.then((value) {
      var data = IterableNullSafetyExtension(
          value.data?.map((e) => movieMapper.map(e))).orEmpty();
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
    var raw = movieApiService.getPopularMovies();
    raw.then((value) {
      var data = IterableNullSafetyExtension(
          value.data?.map((e) => movieMapper.map(e))).orEmpty();
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
    var raw = movieApiService.getPopularPerson();
    return raw.then(
      (value) {
        var data = IterableNullSafetyExtension(
            value.data?.map((e) => personMapper.map(e))).orEmpty();
        actorDao
            .saveAllActors(data.map((e) => actorEntityMapper.map(e)).toList());
      },
    );
  }

  @override
  Future<MovieDetailVo> getMovieDetails(int movieId) async {
    var favoriteMovies = await movieDao.getFavoriteMovies().first;
    var raw = movieApiService.getMovieDetail(movieId);
    var raw2 = await movieApiService.getMovieDetailCredits(movieId);
    return raw.then((onValue) => onValue.toMovieDetailVo(
        isFavorite: favoriteMovies.filter((it) => it.id == movieId).isNotEmpty,
        casts: raw2.getCasts(),
        crews: raw2.getCrews()));
  }

  @override
  Stream<List<MovieVo>> getDbNowPlayingMovies() {
    return movieDao.getNowPlayingMovies().asyncMap((event) async {
      var movies = await Future.wait(event.map((e) async {
        return movieVoMapper.map(e);
      }));
      return movies.toList();
    });
  }

  @override
  Stream<List<MovieVo>> getDbUpComingMovies() {
    return movieDao.getUpComingMovies().asyncMap((event) async {
      var movies = await Future.wait(event.map((e) async {
        return movieVoMapper.map(e);
      }));
      return movies.toList();
    });
  }

  @override
  Stream<List<MovieVo>> getDbPopularMovies() {
    return movieDao.getPopularMovies().asyncMap((event) async {
      var movies = await Future.wait(event.map((e) async {
        return movieVoMapper.map(e);
      }));
      return movies.toList();
    });
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

  @override
  Stream<List<MovieVo>> getDbFavoriteMOvies() {
    return movieDao.getFavoriteMovies().asyncMap((event) async {
      var movies = await Future.wait(event.map((e) async {
        return movieVoMapper.map(e);
      }));
      return movies.toList();
    });
  }

  @override
  saveFavoriteMovie(int id) {
    movieDao.updatedFavoriteMovie(id);
  }

  @override
  Future<List<MovieVo>> getNowPlayingMoviesPaging({int page = 1}) async {
    var raw = await movieApiService.getNowPlayingMovies(page: page);
    return IterableNullSafetyExtension(raw.data?.map((e) => movieMapper.map(e)))
        .orEmpty();
  }

  @override
  Future<List<MovieVo>> getUpComingMoviesPaging({int page = 1}) async {
    var raw = await movieApiService.getUpComingMovies(page: page);
    return IterableNullSafetyExtension(raw.data?.map((e) => movieMapper.map(e)))
        .orEmpty();
  }
}
