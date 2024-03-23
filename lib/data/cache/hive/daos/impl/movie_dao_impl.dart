import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/movie_dao.dart';
import 'package:movieapp_clean_arch/data/cache/hive/entities/movie_entity.dart';
import 'package:movieapp_clean_arch/data/cache/hive/hive_constants.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../entities/movie_favorite_entity.dart';

class MovieDaoImpl extends MovieDao {
  var movieBox = Hive.box<MovieEntity>(BOX_NAME_MOVIE);
  var favoriteBox = Hive.box<MovieFavoriteEntity>(BOX_NAME_MOVIE_FAVORITE);

  List<MovieEntity> getAllMovies() {
    return movieBox.values.toList();
  }

  Stream<void> getAllMoviesEventStream() {
    var movieBoxStream = movieBox.watch();
    var favoriteBoxStream = favoriteBox.watch();
    return movieBoxStream.merge(favoriteBoxStream);
  }

  @override
  void saveAllMovie(List<MovieEntity> movieList) {
    Map<String, MovieEntity> insertMovies = {
      for (var element in movieList) element.key.toString(): element
    };

    var movie = movieList.firstOrNull;
    var oldKeys = getAllMovies()
        .filter((element) =>
            element.isNowPlaying == movie?.isNowPlaying &&
            element.isComingSoon == movie?.isComingSoon &&
            element.isPopular == movie?.isPopular)
        .map((e) => e.key);

    movieBox.deleteAll(oldKeys).then((value) {
      debugPrint("Future impl: ${oldKeys.join(", ")}");
      movieBox.putAll(insertMovies);
    });
  }

  @override
  Stream<List<MovieEntity>> getNowPlayingMovies() {
    return getAllMoviesEventStream()
        .startWith(
            getAllMovies().where((element) => element.isNowPlaying).toList())
        .map((event) =>
            getAllMovies().where((element) => element.isNowPlaying).toList());
  }

  @override
  Stream<List<MovieEntity>> getPopularMovies() {
    return getAllMoviesEventStream()
        .startWith(
            getAllMovies().where((element) => element.isPopular).toList())
        .map((event) =>
            getAllMovies().where((element) => element.isPopular).toList());
  }

  @override
  Stream<List<MovieEntity>> getUpComingMovies() {
    return getAllMoviesEventStream()
        .startWith(
            getAllMovies().where((element) => element.isComingSoon).toList())
        .map((event) =>
            getAllMovies().where((element) => element.isComingSoon).toList());
  }
}
