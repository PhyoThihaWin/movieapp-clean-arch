import 'package:movieapp_clean_arch/domain/entities/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';

abstract class HomeRepository {
  getNowPlayingMovies();

  getUpComingMovies();

  getPopularMovies();

  getPopularPerson();

  Stream<List<MovieVo>> getDbNowPlayingMovies();

  Stream<List<MovieVo>> getDbUpComingMovies();

  Stream<List<MovieVo>> getDbPopularMovies();

  Stream<List<ActorVo>> getDbPopularPerson();
}
