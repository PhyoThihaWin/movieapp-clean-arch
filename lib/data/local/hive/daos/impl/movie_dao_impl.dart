import 'package:dart_extensions/dart_extensions.dart';
import 'package:hive/hive.dart';
import 'package:movieapp_clean_arch/data/local/hive/daos/movie_dao.dart';
import 'package:movieapp_clean_arch/data/local/hive/entities/movie_entity.dart';
import 'package:movieapp_clean_arch/data/local/hive/hive_constants.dart';
import 'package:stream_transform/stream_transform.dart';

class MovieDaoImpl extends MovieDao {
  var movieBox = Hive.box<MovieEntity>(BOX_NAME_MOVIE);

  List<MovieEntity> _getAllMovies() {
    return movieBox.values.toList();
  }

  Stream<void> getAllMoviesEventStream() {
    var movieBoxStream = movieBox.watch();
    return movieBoxStream;
  }

  @override
  void saveAllMovie(List<MovieEntity> movieList) async {
    var movie = movieList.firstOrNull;
    var oldKeys = _getAllMovies()
        .filter((element) =>
            element.isNowPlaying == movie?.isNowPlaying &&
            element.isComingSoon == movie?.isComingSoon &&
            element.isPopular == movie?.isPopular)
        .map((e) => e.key);

    var favoriteMovies = await getFavoriteMovies().first;
    var insertMovies = {
      for (var element in movieList.map((item) {
        if (favoriteMovies.filter((it) => it.id == item.id).isNotEmpty) {
          item.isFavorite = true;
        } else {
          item.isFavorite = false;
        }
        return item;
      }))
        element.key.toString(): element
    };

    await movieBox
        .putAll(insertMovies)
        .then((value) => movieBox.deleteAll(oldKeys));
  }

  @override
  Stream<List<MovieEntity>> getNowPlayingMovies() {
    return getAllMoviesEventStream()
        .startWith(
            _getAllMovies().where((element) => element.isNowPlaying).toList())
        .map((event) =>
            _getAllMovies().where((element) => element.isNowPlaying).toList());
  }

  @override
  Stream<List<MovieEntity>> getPopularMovies() {
    return getAllMoviesEventStream()
        .startWith(
            _getAllMovies().where((element) => element.isPopular).toList())
        .map((event) =>
            _getAllMovies().where((element) => element.isPopular).toList());
  }

  @override
  Stream<List<MovieEntity>> getUpComingMovies() {
    return getAllMoviesEventStream()
        .startWith(
            _getAllMovies().where((element) => element.isComingSoon).toList())
        .map((event) =>
            _getAllMovies().where((element) => element.isComingSoon).toList());
  }

  @override
  Stream<List<MovieEntity>> getFavoriteMovies() {
    return getAllMoviesEventStream()
        .startWith(_getAllMovies()
            .where((element) => element.isFavorite)
            .distinctBy((predicate) => predicate.id)
            .toList())
        .map((event) => _getAllMovies()
            .where((element) => element.isFavorite)
            .distinctBy((predicate) => predicate.id)
            .toList());
  }

  @override
  void updatedFavoriteMovie(int movieId) {
    var oldKey =
        _getAllMovies().filter((element) => element.id == movieId).map((item) {
      item.isFavorite = !item.isFavorite;
      return item;
    });

    var updatedMovies = {
      for (var element in oldKey) element.key.toString(): element
    };
    movieBox.putAll(updatedMovies);
  }
}
