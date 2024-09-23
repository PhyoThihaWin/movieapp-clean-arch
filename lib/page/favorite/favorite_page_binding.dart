import 'package:get/get.dart';

import '../../domain/usecase/get_favorite_movies_usecase.dart';
import 'favorite_page_controller.dart';

class FavoritePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetFavoriteMoviesUsecase(Get.find()));

    Get.lazyPut(() => FavoritePageController(
          Get.find(),
        ));
  }
}
