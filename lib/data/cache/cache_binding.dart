import 'package:get/get.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/actor_dao.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/impl/actor_dao_impl.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/impl/movie_favorite_dao_impl.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/movie_dao.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/movie_favorite_dao.dart';

import 'hive/daos/impl/movie_dao_impl.dart';

class CacheBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDao>(() => MovieDaoImpl());
    Get.lazyPut<MovieFavoriteDao>(() => MovieFavoriteDaoImpl());
    Get.lazyPut<ActorDao>(() => ActorDaoImpl());
  }
}
