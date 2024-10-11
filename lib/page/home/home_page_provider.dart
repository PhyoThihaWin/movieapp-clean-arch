import 'package:movieapp_clean_arch/data/repository_provider.dart';
import 'package:movieapp_clean_arch/domain/home/fetch_home_movies_usecase.dart';
import 'package:movieapp_clean_arch/domain/models/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';
import 'package:movieapp_clean_arch/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecase/favorite_movie_usecase.dart';
import '../../domain/usecase/fetch_popular_person_usecase.dart';
import '../../domain/usecase/get_popular_movies_usecase.dart';
import '../../domain/usecase/get_up_coming_movies_usecase.dart';

part 'home_page_provider.g.dart';

@riverpod
FetchHomeMoviesUsecase fetchHomeMoviesUsecase(FetchHomeMoviesUsecaseRef ref) =>
    FetchHomeMoviesUsecase(ref.read(movieRepositoryProvider));

@riverpod
GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase(
        GetNowPlayingMoviesUseCaseRef ref) =>
    GetNowPlayingMoviesUseCase(ref.read(movieRepositoryProvider));

@riverpod
GetUpComingMoviesUseCase getUpComingMoviesUseCase(
        GetUpComingMoviesUseCaseRef ref) =>
    GetUpComingMoviesUseCase(ref.read(movieRepositoryProvider));

@riverpod
GetPopularMoviesUseCase getPopularMoviesUseCase(
        GetPopularMoviesUseCaseRef ref) =>
    GetPopularMoviesUseCase(ref.read(movieRepositoryProvider));

@riverpod
FetchPopularPersonUseCase fetchPopularPersonUseCase(
        FetchPopularPersonUseCaseRef ref) =>
    FetchPopularPersonUseCase(ref.read(movieRepositoryProvider));

@riverpod
FavoriteMovieUseCase favoriteMovieUseCase(FavoriteMovieUseCaseRef ref) =>
    FavoriteMovieUseCase(ref.read(movieRepositoryProvider));

/// page state
///
@riverpod
Stream<List<MovieVo>> nowPlayingMovies(NowPlayingMoviesRef ref) =>
    ref.read(getNowPlayingMoviesUseCaseProvider)();

@riverpod
Stream<List<MovieVo>> upComingMovies(UpComingMoviesRef ref) =>
    ref.read(getUpComingMoviesUseCaseProvider)();

@riverpod
Stream<List<MovieVo>> popularMovies(PopularMoviesRef ref) =>
    ref.read(getPopularMoviesUseCaseProvider)();

@riverpod
Stream<List<ActorVo>> popularPersons(PopularPersonsRef ref) =>
    ref.read(fetchPopularPersonUseCaseProvider)();

@riverpod
class HomeCarouselIndex extends _$HomeCarouselIndex {
  @override
  int build() => 0;

  updateIndex(int index) => state = index;
}
