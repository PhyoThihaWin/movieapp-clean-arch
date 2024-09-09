import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movieapp_clean_arch/base/view_state.dart';
import 'package:movieapp_clean_arch/domain/entities/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';
import 'package:movieapp_clean_arch/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/fetch_popular_person_usecase.dart';
import 'package:movieapp_clean_arch/domain/usecase/fetch_up_coming_movies_usecase.dart';

import '../../domain/usecase/favorite_movie_usecase.dart';

class HomeController extends GetxController {
  final FetchNowPlayingMoviesUseCase _nowPlayingMoviesUseCase;
  final FetchPopularMoviesUseCase _popularMoviesUseCase;
  final FetchPopularPersonUseCase _popularPersonUseCase;
  final FetchUpComingMoviesUseCase _upComingMoviesUseCase;
  final FavoriteMovieUseCase _favoriteMovieUseCase;

  HomeController(
      this._nowPlayingMoviesUseCase,
      this._popularMoviesUseCase,
      this._popularPersonUseCase,
      this._upComingMoviesUseCase,
      this._favoriteMovieUseCase);

  var nowPlayingMovies = Rx<ViewState<List<MovieVo>>>(ViewState.idle());
  var upcomingMovies = Rx<ViewState<List<MovieVo>>>(ViewState.idle());
  var popularMovies = Rx<ViewState<List<MovieVo>>>(ViewState.idle());
  var popularPerson = Rx<ViewState<List<ActorVo>>>(ViewState.idle());

  var position = 0.obs;

  getNowPlayingMovies() {
    nowPlayingMovies.value = ViewState.loading();
    _nowPlayingMoviesUseCase.execute().listen((event) {
      if (event.isNotEmpty) {
        nowPlayingMovies.value = ViewState.success(event);
      }
    });
  }

  getUpComingMovies() async {
    upcomingMovies.value = ViewState.loading();
    _upComingMoviesUseCase.execute().listen((event) {
      debugPrint("HomeController ${event.length}");
      upcomingMovies.value = ViewState.success(event);
    });
  }

  getPopularMovies() async {
    popularMovies.value = ViewState.loading();
    _popularMoviesUseCase.execute().listen((event) {
      popularMovies.value = ViewState.success(event);
    });
  }

  getPopularPerson() async {
    popularPerson.value = ViewState.loading();
    _popularPersonUseCase.execute().listen((event) {
      popularPerson.value = ViewState.success(event);
    });
  }

  saveFavoriteMovie(int id) async {
    _favoriteMovieUseCase.execute(id);
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
