import 'package:movieapp_clean_arch/domain/entities/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';

abstract class HomeRepository {
  getNowPlayingMovies();

  getUpComingMovies();

  getPopularMovies();

  Future<List<ActorVo>> getPopularPerson();

  Stream<List<MovieVo>> getDbNowPlayingMovies();

  Stream<List<MovieVo>> getDbUpComingMovies();

  Stream<List<MovieVo>> getDbPopularMovies();
}
