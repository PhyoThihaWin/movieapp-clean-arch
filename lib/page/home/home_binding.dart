import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:movieapp_clean_arch/data/network/home/home_service.dart';
import 'package:movieapp_clean_arch/data/network/home/mapper/now_playing_movies_mapper.dart';
import 'package:movieapp_clean_arch/data/network/home/mapper/popular_person_mapper.dart';
import 'package:movieapp_clean_arch/data/repository/home_repository_impl.dart';
import 'package:movieapp_clean_arch/page/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    var homeService = HomeService(Get.find<Dio>());
    var movieMapper = NowPlayingMoviesMapper();
    var personMapper = PopularPersonMapper();
    Get.lazyPut(
        () => HomeRepositoryImpl(homeService, movieMapper, personMapper));
    Get.put(HomeController(Get.find<HomeRepositoryImpl>()));
  }
}
