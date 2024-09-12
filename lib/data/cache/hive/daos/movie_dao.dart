import 'package:movieapp_clean_arch/data/cache/hive/entities/movie_entity.dart';

abstract class MovieDao {
  void saveAllMovie(List<MovieEntity> movieList);
  void updatedFavoriteMovie(int movieId);
  Stream<List<MovieEntity>> getNowPlayingMovies();
  Stream<List<MovieEntity>> getUpComingMovies();
  Stream<List<MovieEntity>> getPopularMovies();
  Stream<List<MovieEntity>> getFavoriteMovies();
}
