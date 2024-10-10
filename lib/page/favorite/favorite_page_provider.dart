import 'package:movieapp_clean_arch/data/repository_provider.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecase/get_favorite_movies_usecase.dart';
part 'favorite_page_provider.g.dart';

@riverpod
GetFavoriteMoviesUsecase getFavoriteMoviesUsecase(
    GetFavoriteMoviesUsecaseRef ref) {
  return GetFavoriteMoviesUsecase(ref.read(movieRepositoryProvider));
}

@riverpod
Stream<List<MovieVo>> favoriteMovies(FavoriteMoviesRef ref) {
  return ref.read(getFavoriteMoviesUsecaseProvider)();
}
