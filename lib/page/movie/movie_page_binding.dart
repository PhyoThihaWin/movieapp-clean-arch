import 'package:get/get.dart';
import 'package:movieapp_clean_arch/domain/usecase/get_upcoming_paging_usecase.dart';
import 'package:movieapp_clean_arch/page/movie/movie_page_controller.dart';

import '../../domain/usecase/favorite_movie_usecase.dart';
import '../../domain/usecase/get_nowplaying_paging_usecase.dart';

class MoviePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetNowplayingPagingUsecase(Get.find()));
    Get.lazyPut(() => GetUpcomingPagingUsecase(Get.find()));
    Get.lazyPut(() => FavoriteMovieUseCase(Get.find()));

    Get.lazyPut(() => MoviePageController(
          Get.find(),
          Get.find(),
          Get.find(),
        ));
  }

  bool dispose() {
    Get.delete<GetNowplayingPagingUsecase>();
    Get.delete<GetUpcomingPagingUsecase>();
    Get.delete<FavoriteMovieUseCase>();
    Get.delete<MoviePageController>();
    return true;
  }
}
