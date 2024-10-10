import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecase/get_nowplaying_paging_usecase.dart';
import '../../domain/usecase/get_upcoming_paging_usecase.dart';
import '../movie/movie_page_provider.dart';
import 'movie_type.dart';

part 'movie_listing_page_provider.g.dart';

@riverpod
class ListPagingMovies extends _$ListPagingMovies {
  late GetNowplayingPagingUsecase _nowPlayingPagingUseCase;
  late GetUpcomingPagingUsecase _upcomingPagingUsecase;

  @override
  void build() {
    _nowPlayingPagingUseCase = ref.read(getNowplayingPagingUsecaseProvider);
    _upcomingPagingUsecase = ref.read(getUpcomingPagingUsecaseProvider);
  }

  fetchPage(
    int pageKey,
    MovieType movieType,
    PagingController pagingController,
  ) async {
    try {
      final newItems = switch (movieType) {
        MovieType.nowPlaying => await _nowPlayingPagingUseCase(pageKey),
        MovieType.upComing => await _upcomingPagingUsecase(pageKey),
        MovieType.popular => throw UnimplementedError(),
      };

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
