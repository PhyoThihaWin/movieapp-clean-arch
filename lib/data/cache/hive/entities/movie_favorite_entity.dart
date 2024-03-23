import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieapp_clean_arch/data/cache/hive/hive_constants.dart';

part 'movie_favorite_entity.g.dart';

@HiveType(
    typeId: HIVE_TYPE_ID_MOVIE_FAVORITE,
    adapterName: "MovieFavoriteEntityAdapter")
class MovieFavoriteEntity {
  @HiveField(0)
  final int id;

  MovieFavoriteEntity(this.id);
}
