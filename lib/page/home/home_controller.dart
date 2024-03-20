import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movieapp_clean_arch/base/view_state.dart';
import 'package:movieapp_clean_arch/domain/entities/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';
import 'package:movieapp_clean_arch/domain/repository/home/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  var nowPlayingMovies = Rx<ViewState<List<MovieVo>>>(ViewState.idle());
  var upcomingMovies = Rx<ViewState<List<MovieVo>>>(ViewState.idle());
  var popularMovies = Rx<ViewState<List<MovieVo>>>(ViewState.idle());
  var popularPerson = Rx<ViewState<List<ActorVo>>>(ViewState.idle());

  var position = 0.obs;

  getNowPlayingMovies() async {
    var data = await _homeRepository.getNowPlayingMovies();
    debugPrint("Data: $data");
    nowPlayingMovies.value = ViewState.success(data);
  }

  getUpComingMovies() async {
    var data = await _homeRepository.getUpComingMovies();
    upcomingMovies.value = ViewState.success(data);
  }

  getPopularMovies() async {
    var data = await _homeRepository.getPopularMovies();
    popularMovies.value = ViewState.success(data);
  }

  getPopularPerson() async {
    popularPerson.value = ViewState.loading();

    var data = await _homeRepository.getPopularPerson();
    popularPerson.value = ViewState.success(data);
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
