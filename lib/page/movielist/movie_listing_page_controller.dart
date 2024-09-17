import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../data/network/apiclient/api_constants.dart';
import '../../domain/usecase/favorite_movie_usecase.dart';
import '../../domain/usecase/fetch_now_playing_movies_usecase.dart';
import '../../domain/usecase/fetch_popular_movies_usecase.dart';
import '../../domain/usecase/fetch_popular_person_usecase.dart';
import '../../domain/usecase/fetch_up_coming_movies_usecase.dart';

class MovieListingPageController extends GetxController {
  final FetchNowPlayingMoviesUseCase _nowPlayingMoviesUseCase;
  final FetchPopularMoviesUseCase _popularMoviesUseCase;
  final FetchPopularPersonUseCase _popularPersonUseCase;
  final FetchUpComingMoviesUseCase _upComingMoviesUseCase;
  final FavoriteMovieUseCase _favoriteMovieUseCase;

  MovieListingPageController(
      this._nowPlayingMoviesUseCase,
      this._popularMoviesUseCase,
      this._popularPersonUseCase,
      this._upComingMoviesUseCase,
      this._favoriteMovieUseCase);

  final PagingController<int, String> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 15);

  Future<void> _fetchPage(int pageKey) async {
    try {
      debugPrint("Reached Fetch ${pageKey}");
      final newItems = List.generate(20, (index) => 'Item $index');
      await Future.delayed(Duration(seconds: 1));

      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}
