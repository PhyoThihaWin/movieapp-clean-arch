import 'package:dart_extensions/dart_extensions.dart';
import 'package:hive/hive.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/movie_favorite_dao.dart';
import 'package:movieapp_clean_arch/data/cache/hive/entities/movie_favorite_entity.dart';
import 'package:movieapp_clean_arch/data/cache/hive/hive_constants.dart';

class MovieFavoriteDaoImpl extends MovieFavoriteDao {
  var favoriteBox = Hive.box<MovieFavoriteEntity>(BOX_NAME_MOVIE_FAVORITE);

  List<MovieFavoriteEntity> getAllFavoriteMovies() {
    return favoriteBox.values.toList();
  }

  @override
  favoriteMovie(int id) {
    var isFavorite = favoriteBox.get(id) != null;

    if (isFavorite) {
      favoriteBox.delete(id);
    } else {
      var favoriteEntity = MovieFavoriteEntity(id);
      favoriteBox.put(favoriteEntity.id, favoriteEntity);
    }
  }

  @override
  Future<bool> isFavoriteMovie(int id) async {
    return getAllFavoriteMovies().find((selector) => selector.id == id) != null;
  }
}
