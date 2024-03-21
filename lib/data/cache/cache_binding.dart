import 'package:get/get.dart';
import 'package:movieapp_clean_arch/data/cache/home/daos/movie_dao.dart';

import 'home/daos/movie_dao_impl.dart';

class CacheBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDao>(() => MovieDaoImpl());
  }
}
