import 'package:hive/hive.dart';
import 'package:movieapp_clean_arch/data/cache/hive/hive_constants.dart';
import 'package:movieapp_clean_arch/data/cache/home/daos/movie_dao.dart';
import 'package:movieapp_clean_arch/data/cache/home/entities/movie_entity.dart';

class MovieDaoImpl extends MovieDao {
  var movieBox = Hive.box<MovieEntity>(BOX_NAME_MOVIE);

  List<MovieEntity> getAllMovies() {
    return movieBox.values.toList();
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
  Stream<List<MovieEntity>> getNowPlayingMovies() {
    return Stream.value(
        getAllMovies().where((element) => element.isNowPlaying).toList());
  }

  @override
  Stream<List<MovieEntity>> getPopularMovies() {
    return Stream.value(
        getAllMovies().where((element) => element.isPopular).toList());
  }

  @override
  Stream<List<MovieEntity>> getUpComingMovies() {
    return Stream.value(
        getAllMovies().where((element) => element.isComingSoon).toList());
  }
}
