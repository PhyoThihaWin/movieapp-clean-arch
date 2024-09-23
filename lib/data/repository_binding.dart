import 'package:get/get.dart';

import '../domain/repository/home/movie_repository.dart';
import 'repository/movie_repository_impl.dart';

class RepositoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieRepository>(() => MovieRepositoryImpl(
          Get.find(),
          Get.find(),
          Get.find(),
        ));
  }
}
