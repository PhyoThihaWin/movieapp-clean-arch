import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/data/repository_provider.dart';
import 'package:movieapp_clean_arch/domain/usecase/get_upcoming_paging_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecase/favorite_movie_usecase.dart';
import '../../domain/usecase/get_nowplaying_paging_usecase.dart';

part 'movie_page_provider.g.dart';

@riverpod
GetNowplayingPagingUsecase getNowplayingPagingUsecase(
        GetNowplayingPagingUsecaseRef ref) =>
    GetNowplayingPagingUsecase(ref.read(movieRepositoryProvider));

@riverpod
GetUpcomingPagingUsecase getUpcomingPagingUsecase(
        GetUpcomingPagingUsecaseRef ref) =>
    GetUpcomingPagingUsecase(ref.read(movieRepositoryProvider));

@riverpod
FavoriteMovieUseCase favoriteMovieUseCase(FavoriteMovieUseCaseRef ref) =>
    FavoriteMovieUseCase(ref.read(movieRepositoryProvider));

@riverpod
class PagingMovies extends _$PagingMovies {
  int _tabIndex = 0;
  late GetNowplayingPagingUsecase _nowPlayingPagingUseCase;
  late GetUpcomingPagingUsecase _upcomingPagingUsecase;

  @override
  void build() {
    debugPrint("Reached build $_tabIndex");

    _nowPlayingPagingUseCase = ref.read(getNowplayingPagingUsecaseProvider);
    _upcomingPagingUsecase = ref.read(getUpcomingPagingUsecaseProvider);
  }

  changeTab(int tabIndex, PagingController pagingController) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _tabIndex = tabIndex;
    pagingController.refresh();
  }

  fetchPage(int pageKey, PagingController pagingController) async {
    try {
      final newItems = _tabIndex == 0
          ? await _nowPlayingPagingUseCase(pageKey)
          : await _upcomingPagingUsecase(pageKey);

      final isLastPage = newItems.isEmpty;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        pagingController.appendPage(newItems, pageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
