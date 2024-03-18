import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movieapp_clean_arch/domain/entities/MovieVo.dart';
import 'package:movieapp_clean_arch/domain/repository/home/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  var nowPlayingMovies = Rx<List<MovieVo>?>(null);

  var position = 0.obs;

  getNowPlayingMovies() async {
    var data = await _homeRepository.getNowPlayingMovies();
    debugPrint("Data: $data");
    nowPlayingMovies.value = data;
  }

  @override
  void onInit() {
    super.onInit();
    getNowPlayingMovies();
  }

}
