import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/domain/usecase/get_upcoming_paging_usecase.dart';

import '../../domain/models/movie_vo.dart';
import '../../domain/usecase/favorite_movie_usecase.dart';
import '../../domain/usecase/get_nowplaying_paging_usecase.dart';

class MoviePageController extends GetxController {
  final GetNowplayingPagingUsecase _nowPlayingMoviesUseCase;
  final GetUpcomingPagingUsecase _upcomingPagingUsecase;
  final FavoriteMovieUseCase _favoriteMovieUseCase;

  MoviePageController(
    this._nowPlayingMoviesUseCase,
    this._favoriteMovieUseCase,
    this._upcomingPagingUsecase,
  );

  int _tabIndex = 0;

  // paging controller
  final PagingController<int, MovieVo> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 15);

  void _fetchPage(int pageKey) async {
    debugPrint("Reached Fetch $pageKey");
    try {
      final newItems = _tabIndex == 0
          ? await _nowPlayingMoviesUseCase(pageKey)
          : await _upcomingPagingUsecase(pageKey);

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

  changeTab(int tabIndex) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _tabIndex = tabIndex;
    pagingController.refresh();
  }

  saveFavoriteMovie(int id) {
    _favoriteMovieUseCase.execute(id);
    pagingController.itemList = pagingController.itemList?.map(
      (e) {
        if (e.id == id) {
          var item = e;
          item.isFavorite = !e.isFavorite;
          return item;
        } else {
          return e;
        }
      },
    ).toList();
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
