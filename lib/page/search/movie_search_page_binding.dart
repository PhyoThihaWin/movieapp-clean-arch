import 'package:get/get.dart';
import 'package:movieapp_clean_arch/domain/usecase/search_movies_usecase.dart';
import 'package:movieapp_clean_arch/page/search/movie_search_page_controller.dart';

import '../../domain/usecase/favorite_movie_usecase.dart';
import '../../domain/usecase/get_nowplaying_paging_usecase.dart';
import '../../domain/usecase/get_upcoming_paging_usecase.dart';

class MovieSearchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchMoviesUsecase(Get.find()));
    Get.lazyPut(() => FavoriteMovieUseCase(Get.find()));

    Get.lazyPut(() => MovieSearchPageController(
          Get.find(),
          Get.find(),
        ));
  }

  bool dispose() {
    Get.delete<GetNowplayingPagingUsecase>();
    Get.delete<FavoriteMovieUseCase>();
    Get.delete<MovieSearchPageController>();
    return true;
  }
}
