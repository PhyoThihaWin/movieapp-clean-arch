import 'package:get/get.dart';
import 'package:movieapp_clean_arch/data/cache/datasource/app_config_datasource.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/actor_dao.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/impl/actor_dao_impl.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/movie_dao.dart';

import 'hive/daos/impl/movie_dao_impl.dart';

class CacheBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDao>(() => MovieDaoImpl());
    Get.lazyPut<ActorDao>(() => ActorDaoImpl());
    Get.lazyPut<AppConfigDatasource>(() => AppConfigDatasource());
  }
}
