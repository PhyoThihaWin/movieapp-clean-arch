import 'package:get/get.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';
import 'package:movieapp_clean_arch/domain/usecase/get_favorite_movies_usecase.dart';

class FavoritePageController extends GetxController {
  final GetFavoriteMoviesUsecase _getFavoriteMoviesUsecase;

  FavoritePageController(this._getFavoriteMoviesUsecase);

  Stream<List<MovieVo>> getFavoriteMovies() => _getFavoriteMoviesUsecase();
}
