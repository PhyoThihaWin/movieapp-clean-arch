import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';
import 'package:movieapp_clean_arch/page/movielist/movie_listing_page.dart';

import '../../domain/usecase/favorite_movie_usecase.dart';
import '../../domain/usecase/get_nowplaying_paging_usecase.dart';
import '../../domain/usecase/get_upcoming_paging_usecase.dart';

class MovieListingPageController extends GetxController {
  final GetNowplayingPagingUsecase _nowPlayingPagingUseCase;
  final GetUpcomingPagingUsecase _upcomingPagingUsecase;
  final FavoriteMovieUseCase _favoriteMovieUseCase;

  MovieListingPageController(
    this._nowPlayingPagingUseCase,
    this._favoriteMovieUseCase,
    this._upcomingPagingUsecase,
  );

  // paging controller
  final PagingController<int, MovieVo> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 15);

  void _fetchPage(int pageKey, MovieType movieType) async {
    try {
      debugPrint("Reached Fetch $pageKey");
      final newItems = switch (movieType) {
        MovieType.nowPlaying => await _nowPlayingPagingUseCase(pageKey),
        MovieType.upComing => await _upcomingPagingUsecase(pageKey),
        MovieType.popular => throw UnimplementedError(),
      };
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

  Future fetchMovies(MovieType movieType) async {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey + 1, movieType);
    });
  }

  @override
  void onClose() {
    pagingController.dispose();
    debugPrint("ListPage Controller disposed");
    super.onClose();
  }
}
