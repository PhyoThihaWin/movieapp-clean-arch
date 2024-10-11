// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:movieapp_clean_arch/domain/usecase/search_movies_usecase.dart';

// import '../../domain/models/movie_vo.dart';
// import '../../domain/usecase/favorite_movie_usecase.dart';

// class MovieSearchPageController extends GetxController {
//   final SearchMoviesUsecase _searchMoviesUsecase;
//   final FavoriteMovieUseCase _favoriteMovieUseCase;

//   final Rx<String> _searchQuery = "".obs;

//   // paging controller
//   final PagingController<int, MovieVo> pagingController =
//       PagingController(firstPageKey: 0, invisibleItemsThreshold: 15);

//   MovieSearchPageController(
//       this._searchMoviesUsecase, this._favoriteMovieUseCase);

//   void _fetchPage(int pageKey) async {
//     try {
//       debugPrint("Reached Fetch $pageKey");
//       final newItems = await _searchMoviesUsecase(
//         query: _searchQuery.value == "" ? null : _searchQuery.value,
//         page: pageKey,
//       );

//       await Future.delayed(const Duration(seconds: 1));
//       final isLastPage = newItems.isEmpty;
//       if (isLastPage) {
//         pagingController.appendLastPage(newItems);
//       } else {
//         pagingController.appendPage(newItems, pageKey);
//       }
//     } catch (error) {
//       error.printInfo();
//       pagingController.error = error;
//     }
//   }

//   void searchMovies(String query) {
//     _searchQuery.value = query;
//   }

//   saveFavoriteMovie(int id) {
//     _favoriteMovieUseCase.execute(id);
//     pagingController.itemList = pagingController.itemList?.map(
//       (e) {
//         if (e.id == id) {
//           var item = e;
//           item.isFavorite = !e.isFavorite;
//           return item;
//         } else {
//           return e;
//         }
//       },
//     ).toList();
//   }

//   @override
//   void onInit() {
//     super.onInit();

//     pagingController.addPageRequestListener((pageKey) {
//       _fetchPage(pageKey + 1);
//     });
//     debounce(_searchQuery, (value) {
//       pagingController.refresh();
//     });
//   }

//   @override
//   void onClose() {
//     pagingController.dispose();
//     debugPrint("ListPage Controller disposed");
//     super.onClose();
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/data/repository_provider.dart';
import 'package:movieapp_clean_arch/domain/usecase/search_movies_usecase.dart';
import 'package:movieapp_clean_arch/page/search/movie_search_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_search_page_provider.g.dart';

@riverpod
class SearchQuery extends _$SearchQuery {
  final _debouncer = Debouncer();

  @override
  String? build() => null;

  updateQuery(String? query, PagingController pagingController) async {
    _debouncer(
      () {
        state = query;
        pagingController.refresh();
      },
    );

    ref.onDispose(
      () {
        _debouncer.dispose();
      },
    );
  }
}

@riverpod
SearchMoviesUsecase searchMoviesUsecase(SearchMoviesUsecaseRef ref) =>
    SearchMoviesUsecase(ref.read(movieRepositoryProvider));

@riverpod
class SearchPagingMovies extends _$SearchPagingMovies {
  late SearchMoviesUsecase _searchMoviesUsecase;

  @override
  void build() {
    _searchMoviesUsecase = ref.read(searchMoviesUsecaseProvider);
  }

  fetchPage(int pageKey, PagingController pagingController) async {
    try {
      final searchQuery = ref.watch(searchQueryProvider);
      final newItems = await _searchMoviesUsecase(
        query: searchQuery == "" ? null : searchQuery,
        page: pageKey,
      );

      final isLastPage = newItems.isEmpty;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        pagingController.appendPage(newItems, pageKey);
      }
    } catch (error) {
      debugPrint(error.toString());
      pagingController.error = error;
    }
  }
}

class Debouncer {
  Debouncer({this.delay = const Duration(milliseconds: 600)});

  final Duration delay;
  Timer? _timer;

  void call(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
