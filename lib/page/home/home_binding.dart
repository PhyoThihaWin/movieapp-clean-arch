import 'package:get/get.dart';
import 'package:movieapp_clean_arch/data/cache/hive/mapper/actor_entity_mapper.dart';
import 'package:movieapp_clean_arch/data/cache/hive/mapper/movie_entity_mapper.dart';
import 'package:movieapp_clean_arch/data/cache/hive/mapper/movie_vo_mapper.dart';
import 'package:movieapp_clean_arch/data/network/home/mapper/now_playing_movies_mapper.dart';
import 'package:movieapp_clean_arch/data/network/home/mapper/popular_person_mapper.dart';
import 'package:movieapp_clean_arch/data/repository/home_repository_impl.dart';
import 'package:movieapp_clean_arch/domain/repository/home/home_repository.dart';
import 'package:movieapp_clean_arch/domain/usecase/favorite_movie_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/fetch_popular_person_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/fetch_up_coming_movies_usecase.dart';
import 'package:movieapp_clean_arch/page/home/home_controller.dart';

import '../../data/cache/hive/mapper/actor_vo_mapper.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    var movieMapper = NowPlayingMoviesMapper();
    var personMapper = PopularPersonMapper();
    var movieEntityMapper = MovieVoMapper();
    var movieVoMapper = MovieEntityMapper();
    var actorEntityMapper = ActorEntityMapper();
    var actorVoMapper = ActorVoMapper();

    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
        movieMapper,
        personMapper,
        movieEntityMapper,
        movieVoMapper,
        actorEntityMapper,
        actorVoMapper));

    Get.lazyPut(() => FetchNowPlayingMoviesUseCase(Get.find()));
    Get.lazyPut(() => FetchPopularMoviesUseCase(Get.find()));
    Get.lazyPut(() => FetchUpComingMoviesUseCase(Get.find()));
    Get.lazyPut(() => FetchPopularPersonUseCase(Get.find()));
    Get.lazyPut(() => FavoriteMovieUseCase(Get.find()));

    Get.lazyPut(() => HomeController(
        Get.find(), Get.find(), Get.find(), Get.find(), Get.find()));
  }
}
