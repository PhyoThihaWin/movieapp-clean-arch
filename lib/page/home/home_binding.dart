import 'package:get/get.dart';
import 'package:movieapp_clean_arch/data/repository/app_config_repository_impl.dart';
import 'package:movieapp_clean_arch/domain/home/fetch_home_movies_usecase.dart';
import 'package:movieapp_clean_arch/domain/repository/other/app_config_repository.dart';
import 'package:movieapp_clean_arch/domain/usecase/favorite_movie_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/fetch_popular_person_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/get_movie_detail_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/get_up_coming_movies_usecase.dart';
import 'package:movieapp_clean_arch/page/home/home_page_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchHomeMoviesUsecase(Get.find()));
    Get.lazyPut(() => GetNowPlayingMoviesUseCase(Get.find()));
    Get.lazyPut(() => GetPopularMoviesUseCase(Get.find()));
    Get.lazyPut(() => GetUpComingMoviesUseCase(Get.find()));
    Get.lazyPut(() => FetchPopularPersonUseCase(Get.find()));
    Get.lazyPut(() => FavoriteMovieUseCase(Get.find()));

    Get.lazyPut(() => GetMovieDetailUsecase(Get.find()));

    Get.lazyPut<AppConfigRepository>(() => AppConfigRepositoryImpl(Get.find()));

    Get.lazyPut(() => HomePageController(
          Get.find(),
          Get.find(),
          Get.find(),
          Get.find(),
          Get.find(),
          Get.find(),
        ));
  }
}
