import 'package:hive/hive.dart';
import 'package:movieapp_clean_arch/data/cache/hive/hive_constants.dart';
import 'package:movieapp_clean_arch/data/cache/home/daos/movie_dao.dart';
import 'package:movieapp_clean_arch/data/cache/hive/entities/movie_entity.dart';

class MovieDaoImpl extends MovieDao {
  var movieBox = Hive.box<MovieEntity>(BOX_NAME_MOVIE);

  List<MovieEntity> getAllMovies() {
    return movieBox.values.toList();
  }

  @override
  Stream<void> getAllMoviesEventStream() {
    return movieBox.watch();
  }

  @override
  void saveAllMovie(List<MovieEntity> movieList) {
    var startingId = movieBox.length + 1;
    Map<int, MovieEntity> movies = {
      for (var element in movieList) startingId++: element
    };
    movieBox.putAll(movies);
  }

  @override
  List<MovieEntity> getNowPlayingMovies() {
    return getAllMovies().where((element) => element.isNowPlaying).toList();
  }

  @override
  List<MovieEntity> getPopularMovies() {
    return getAllMovies().where((element) => element.isPopular).toList();
  }

  @override
  List<MovieEntity> getUpComingMovies() {
    return getAllMovies().where((element) => element.isComingSoon).toList();
  }
}
