import 'package:dart_extensions/dart_extensions.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/actor_dao.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/movie_dao.dart';
import 'package:movieapp_clean_arch/domain/models/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';
import 'package:movieapp_clean_arch/domain/repository/home/movie_repository.dart';

import '../../domain/models/movie_detail_vo.dart';
import '../network/movie/movie_service.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieApiService movieApiService;
  final MovieDao movieDao;
  final ActorDao actorDao;

  MovieRepositoryImpl(
    this.movieApiService,
    this.movieDao,
    this.actorDao,
  );

  @override
  getNowPlayingMovies() {
    var raw = movieApiService.getNowPlayingMovies();
    raw.then((value) {
      var entity = value.data?.map((value) {
            var item = value.toMovieEntity();
            item.isNowPlaying = true;
            item.isComingSoon = false;
            item.isPopular = false;
            return item;
          }) ??
          [];
      movieDao.saveAllMovie(entity.toList());
    });
  }

  @override
  getUpComingMovies() {
    var raw = movieApiService.getUpComingMovies();
    raw.then((value) {
      var entity = value.data?.map((value) {
            var item = value.toMovieEntity();
            item.isNowPlaying = false;
            item.isComingSoon = true;
            item.isPopular = false;
            return item;
          }) ??
          [];
      movieDao.saveAllMovie(entity.toList());
    });
  }

  @override
  getPopularMovies() {
    var raw = movieApiService.getPopularMovies();
    raw.then((value) {
      var entity = value.data?.map((value) {
            var item = value.toMovieEntity();
            item.isNowPlaying = false;
            item.isComingSoon = false;
            item.isPopular = true;
            return item;
          }) ??
          [];
      movieDao.saveAllMovie(entity.toList());
    });
  }

  @override
  getPopularPerson() {
    var raw = movieApiService.getPopularPerson();
    return raw.then(
      (value) => actorDao.saveAllActors(
          value.data?.map((value) => value.toActorEntity()).toList() ?? []),
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
    return movieDao
        .getNowPlayingMovies()
        .asyncMap((event) => event.map((value) => value.toMovieVo()).toList());
  }

  @override
  Stream<List<MovieVo>> getDbUpComingMovies() {
    return movieDao
        .getUpComingMovies()
        .asyncMap((event) => event.map((value) => value.toMovieVo()).toList());
  }

  @override
  Stream<List<MovieVo>> getDbPopularMovies() {
    return movieDao
        .getPopularMovies()
        .asyncMap((event) => event.map((value) => value.toMovieVo()).toList());
  }

  @override
  Stream<List<ActorVo>> getDbPopularPerson() {
    getPopularPerson();
    return actorDao
        .getActors()
        .asyncMap((event) => event.map((value) => value.toActorVo()).toList());
  }

  @override
  Stream<List<MovieVo>> getDbFavoriteMOvies() {
    return movieDao
        .getFavoriteMovies()
        .asyncMap((event) => event.map((value) => value.toMovieVo()).toList());
  }

  @override
  saveFavoriteMovie(int id) {
    movieDao.updatedFavoriteMovie(id);
  }

  @override
  Future<List<MovieVo>> getNowPlayingMoviesPaging({int page = 1}) async {
    var raw = await movieApiService.getNowPlayingMovies(page: page);
    return raw.data?.map((e) => e.toMovieVo(false)).toList() ?? [];
  }

  @override
  Future<List<MovieVo>> getUpComingMoviesPaging({int page = 1}) async {
    var raw = await movieApiService.getUpComingMovies(page: page);
    return raw.data?.map((e) => e.toMovieVo(false)).toList() ?? [];
  }
}
