import 'package:get/get.dart';

import '../../domain/usecase/favorite_movie_usecase.dart';
import '../../domain/usecase/get_movie_detail_usecase.dart';
import 'movie_detail_page_controller.dart';

class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteMovieUseCase(Get.find()));
    Get.lazyPut(() => GetMovieDetailUsecase(Get.find()));

    Get.lazyPut(() => MovieDetailPageController(
          Get.find(),
          Get.find(),
        ));
  }

  bool dispose() {
    Get.delete<FavoriteMovieUseCase>();
    Get.delete<GetMovieDetailUsecase>();
    Get.delete<MovieDetailPageController>();
    return true;
  }
}
