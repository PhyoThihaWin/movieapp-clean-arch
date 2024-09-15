import 'package:get/get.dart';
import 'package:movieapp_clean_arch/domain/models/movie_detail_vo.dart';
import 'package:movieapp_clean_arch/domain/usecase/get_movie_detail_usecase.dart';

import '../../base/view_state.dart';

class MovieDetailPageController extends GetxController {
  final GetMovieDetailUsecase getMovieDetailUsecase;

  MovieDetailPageController(this.getMovieDetailUsecase);

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
}
