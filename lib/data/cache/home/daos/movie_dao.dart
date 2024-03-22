import 'package:movieapp_clean_arch/data/cache/hive/entities/movie_entity.dart';

abstract class MovieDao {
  void saveAllMovie(List<MovieEntity> movieList);

  Stream<void> getAllMoviesEventStream();

  List<MovieEntity> getNowPlayingMovies();

  List<MovieEntity> getUpComingMovies();

  List<MovieEntity> getPopularMovies();
}
