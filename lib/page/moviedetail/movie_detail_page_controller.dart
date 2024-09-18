import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp_clean_arch/domain/models/movie_detail_vo.dart';
import 'package:movieapp_clean_arch/domain/usecase/get_movie_detail_usecase.dart';

import '../../base/view_state.dart';
import '../../domain/usecase/favorite_movie_usecase.dart';

class MovieDetailPageController extends GetxController {
  final GetMovieDetailUsecase getMovieDetailUsecase;
  final FavoriteMovieUseCase _favoriteMovieUseCase;

  MovieDetailPageController(
      this.getMovieDetailUsecase, this._favoriteMovieUseCase);

  var cinemaIndex = 0.obs;
  var movieDetails = Rx<ViewState<MovieDetailVo>>(ViewState.idle());

  getMovieDetail(int movieId) {
    movieDetails.value = ViewState.loading();
    getMovieDetailUsecase(movieId).then((onValue) async {
      await Future.delayed(Duration(seconds: 1));
      movieDetails.value = ViewState.success(onValue);
    }).onError((error, stackTrace) {
      movieDetails.value = ViewState.error("Something went wrong");
    });
  }

  saveFavoriteMovie(int id) async {
    _favoriteMovieUseCase.execute(id);
    if (movieDetails.value is ViewStateSuccess<MovieDetailVo>) {
      var newDetail = movieDetails.value as ViewStateSuccess<MovieDetailVo>;
      newDetail.data.isFavorite = !newDetail.data.isFavorite;
      movieDetails.value = ViewState.success(newDetail.data);
    }
  }

  @override
  void dispose() {
    debugPrint("DetailPage Controller disposed");
    super.dispose();
  }

  @override
  void onClose() {
    debugPrint("DetailPage Controller onClose");
    super.onClose();
  }
}
