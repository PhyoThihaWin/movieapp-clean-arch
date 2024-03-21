import 'package:movieapp_clean_arch/data/cache/home/entities/movie_entity.dart';

abstract class MovieDao {
  void saveAllMovie(List<MovieEntity> movieList);

  Stream<List<MovieEntity>> getNowPlayingMovies();

  Stream<List<MovieEntity>> getUpComingMovies();

  Stream<List<MovieEntity>> getPopularMovies();
}
