import 'package:movieapp_clean_arch/domain/entities/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';

abstract class HomeRepository {
  Future<List<MovieVo>> getNowPlayingMovies();

  Future<List<MovieVo>> getUpComingMovies();

  Future<List<MovieVo>> getPopularMovies();

  Future<List<ActorVo>> getPopularPerson();
}
