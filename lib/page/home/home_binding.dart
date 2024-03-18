import 'package:get/get.dart';
import 'package:movieapp_clean_arch/data/network/dio_client.dart';
import 'package:movieapp_clean_arch/data/network/home/home_service.dart';
import 'package:movieapp_clean_arch/data/network/home/mapper/now_playing_movies_mapper.dart';
import 'package:movieapp_clean_arch/data/repository/home_repository_impl.dart';
import 'package:movieapp_clean_arch/page/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    var homeService = HomeService(DioClient.getDio());
    var mapper = NowPlayingMoviesMapper();
    Get.lazyPut(() => HomeRepositoryImpl(homeService, mapper));
    Get.put(HomeController(Get.find<HomeRepositoryImpl>()));
  }
}
