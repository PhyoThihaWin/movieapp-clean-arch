import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';

import '../../domain/usecase/favorite_movie_usecase.dart';
import '../../domain/usecase/get_nowplaying_paging_usecase.dart';

class MovieListingPageController extends GetxController {
  final GetNowplayingPagingUsecase _nowPlayingMoviesUseCase;
  final FavoriteMovieUseCase _favoriteMovieUseCase;

  MovieListingPageController(
      this._nowPlayingMoviesUseCase, this._favoriteMovieUseCase);

  // paging controller
  final PagingController<int, MovieVo> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 15);

  void _fetchPage(int pageKey) async {
    try {
      debugPrint("Reached Fetch $pageKey");
      final newItems = await _nowPlayingMoviesUseCase(pageKey);
      await Future.delayed(const Duration(seconds: 1));
      final isLastPage = newItems.isEmpty;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        pagingController.appendPage(newItems, pageKey);
      }
    } catch (error) {
      error.printInfo();
      pagingController.error = error;
    }
  }

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey + 1);
    });
  }

  @override
  void onClose() {
    pagingController.dispose();
    debugPrint("ListPage Controller disposed");
    super.onClose();
  }
}
