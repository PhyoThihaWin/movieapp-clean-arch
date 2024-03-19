import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movieapp_clean_arch/domain/entities/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';
import 'package:movieapp_clean_arch/domain/repository/home/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  var nowPlayingMovies = Rx<List<MovieVo>?>(null);
  var upcomingMovies = Rx<List<MovieVo>?>(null);
  var popularMovies = Rx<List<MovieVo>?>(null);
  var popularPerson = Rx<List<ActorVo>?>(null);

  var position = 0.obs;

  getNowPlayingMovies() async {
    var data = await _homeRepository.getNowPlayingMovies();
    debugPrint("Data: $data");
    nowPlayingMovies.value = data;
  }

  getUpComingMovies() async {
    var data = await _homeRepository.getUpComingMovies();
    upcomingMovies.value = data;
  }

  getPopularMovies() async {
    var data = await _homeRepository.getPopularMovies();
    popularMovies.value = data;
  }

  getPopularPerson() async {
    var data = await _homeRepository.getPopularPerson();
    popularPerson.value = data;
  }

  @override
  void onInit() {
    super.onInit();
    getNowPlayingMovies();
    getUpComingMovies();
    getPopularMovies();
    getPopularPerson();
  }
}
