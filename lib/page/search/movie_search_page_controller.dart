import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/domain/usecase/search_movies_usecase.dart';

import '../../domain/models/movie_vo.dart';
import '../../domain/usecase/favorite_movie_usecase.dart';

class MovieSearchPageController extends GetxController {
  final SearchMoviesUsecase _searchMoviesUsecase;
  final FavoriteMovieUseCase _favoriteMovieUseCase;

  final Rx<String> _searchQuery = "".obs;

  // paging controller
  final PagingController<int, MovieVo> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 15);

  MovieSearchPageController(
      this._searchMoviesUsecase, this._favoriteMovieUseCase);

  void _fetchPage(int pageKey) async {
    try {
      debugPrint("Reached Fetch $pageKey");
      final newItems = await _searchMoviesUsecase(
        query: _searchQuery.value == "" ? null : _searchQuery.value,
        page: pageKey,
      );

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

  void searchMovies(String query) {
    _searchQuery.value = query;
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
    debounce(_searchQuery, (value) {
      pagingController.refresh();
    });
  }

  @override
  void onClose() {
    pagingController.dispose();
    debugPrint("ListPage Controller disposed");
    super.onClose();
  }
}
