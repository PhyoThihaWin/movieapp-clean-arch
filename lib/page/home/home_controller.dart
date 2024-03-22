import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movieapp_clean_arch/base/view_state.dart';
import 'package:movieapp_clean_arch/domain/entities/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';
import 'package:movieapp_clean_arch/domain/repository/home/home_repository.dart';
import 'package:movieapp_clean_arch/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/fetch_popular_person_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/fetch_up_coming_movies_usecase.dart';

class HomeController extends GetxController {
  final FetchNowPlayingMoviesUseCase nowPlayingMoviesUseCase;
  final FetchPopularMoviesUseCase popularMoviesUseCase;
  final FetchPopularPersonUseCase popularPersonUseCase;
  final FetchUpComingMoviesUseCase upComingMoviesUseCase;

  HomeController(this.nowPlayingMoviesUseCase, this.popularMoviesUseCase,
      this.popularPersonUseCase, this.upComingMoviesUseCase);

  var nowPlayingMovies = Rx<ViewState<List<MovieVo>>>(ViewState.idle());
  var upcomingMovies = Rx<ViewState<List<MovieVo>>>(ViewState.idle());
  var popularMovies = Rx<ViewState<List<MovieVo>>>(ViewState.idle());
  var popularPerson = Rx<ViewState<List<ActorVo>>>(ViewState.idle());

  var position = 0.obs;

  getNowPlayingMovies() {
    nowPlayingMovies.value = ViewState.loading();
    nowPlayingMoviesUseCase.execute().listen((event) {
      if (event.isNotEmpty) {
        nowPlayingMovies.value = ViewState.success(event);
      }
    });
  }

  // getUpComingMovies() async {
  //   upcomingMovies.value = ViewState.loading();
  //   var data = await upComingMoviesUseCase.execute();
  //   upcomingMovies.value = ViewState.success(data);
  // }

  getUpComingMovies() async {
    upcomingMovies.value = ViewState.loading();
    upComingMoviesUseCase.execute().listen((event) {
      upcomingMovies.value = ViewState.success(event);
    });
  }

  getPopularMovies() async {
    popularMovies.value = ViewState.loading();
    popularMoviesUseCase.execute().listen((event) {
      popularMovies.value = ViewState.success(event);
    });
  }

  getPopularPerson() async {
    popularPerson.value = ViewState.loading();
    popularPersonUseCase.execute().listen((event) {
      popularPerson.value = ViewState.success(event);
    });
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
