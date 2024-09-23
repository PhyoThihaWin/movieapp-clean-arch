import 'package:get/get.dart';

import '../../domain/usecase/favorite_movie_usecase.dart';
import '../../domain/usecase/get_nowplaying_paging_usecase.dart';
import '../../domain/usecase/get_upcoming_paging_usecase.dart';
import 'movie_listing_page_controller.dart';

class MovieListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetNowplayingPagingUsecase(Get.find()));
    Get.lazyPut(() => GetUpcomingPagingUsecase(Get.find()));
    Get.lazyPut(() => FavoriteMovieUseCase(Get.find()));

    Get.lazyPut(() => MovieListingPageController(
          Get.find(),
          Get.find(),
          Get.find(),
        ));
  }

  bool dispose() {
    Get.delete<GetNowplayingPagingUsecase>();
    Get.delete<FavoriteMovieUseCase>();
    Get.delete<MovieListingPageController>();
    return true;
  }
}
