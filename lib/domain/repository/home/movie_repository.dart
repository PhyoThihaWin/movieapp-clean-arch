import 'package:movieapp_clean_arch/domain/models/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/models/movie_detail_vo.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';

abstract class MovieRepository {
  getNowPlayingMovies();
  getUpComingMovies();
  getPopularMovies();
  getPopularPerson();
  Future<MovieDetailVo> getMovieDetails(int movieId);

  Future<List<MovieVo>> getNowPlayingMoviesPaging({int page = 1});
  Future<List<MovieVo>> getUpComingMoviesPaging({int page = 1});

  Stream<List<MovieVo>> getDbNowPlayingMovies();
  Stream<List<MovieVo>> getDbUpComingMovies();
  Stream<List<MovieVo>> getDbPopularMovies();
  Stream<List<ActorVo>> getDbPopularPerson();
  Stream<List<MovieVo>> getDbFavoriteMOvies();

  saveFavoriteMovie(int id);
}
