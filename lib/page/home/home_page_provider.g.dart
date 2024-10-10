// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchHomeMoviesUsecaseHash() =>
    r'65ebc6f62942df835f905108ffd14ccc3b7b589b';

/// See also [fetchHomeMoviesUsecase].
@ProviderFor(fetchHomeMoviesUsecase)
final fetchHomeMoviesUsecaseProvider =
    AutoDisposeProvider<FetchHomeMoviesUsecase>.internal(
  fetchHomeMoviesUsecase,
  name: r'fetchHomeMoviesUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchHomeMoviesUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchHomeMoviesUsecaseRef
    = AutoDisposeProviderRef<FetchHomeMoviesUsecase>;
String _$getNowPlayingMoviesUseCaseHash() =>
    r'8ebb39eb923221b4535d6e80578d824efd2fb078';

/// See also [getNowPlayingMoviesUseCase].
@ProviderFor(getNowPlayingMoviesUseCase)
final getNowPlayingMoviesUseCaseProvider =
    AutoDisposeProvider<GetNowPlayingMoviesUseCase>.internal(
  getNowPlayingMoviesUseCase,
  name: r'getNowPlayingMoviesUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getNowPlayingMoviesUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNowPlayingMoviesUseCaseRef
    = AutoDisposeProviderRef<GetNowPlayingMoviesUseCase>;
String _$getUpComingMoviesUseCaseHash() =>
    r'836a08c6bedf01b1db86f7e18b4cbf643b4554c9';

/// See also [getUpComingMoviesUseCase].
@ProviderFor(getUpComingMoviesUseCase)
final getUpComingMoviesUseCaseProvider =
    AutoDisposeProvider<GetUpComingMoviesUseCase>.internal(
  getUpComingMoviesUseCase,
  name: r'getUpComingMoviesUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getUpComingMoviesUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetUpComingMoviesUseCaseRef
    = AutoDisposeProviderRef<GetUpComingMoviesUseCase>;
String _$getPopularMoviesUseCaseHash() =>
    r'143c5a0d8bbe84aa8da818082210eb447fd23687';

/// See also [getPopularMoviesUseCase].
@ProviderFor(getPopularMoviesUseCase)
final getPopularMoviesUseCaseProvider =
    AutoDisposeProvider<GetPopularMoviesUseCase>.internal(
  getPopularMoviesUseCase,
  name: r'getPopularMoviesUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getPopularMoviesUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetPopularMoviesUseCaseRef
    = AutoDisposeProviderRef<GetPopularMoviesUseCase>;
String _$fetchPopularPersonUseCaseHash() =>
    r'80e5e357ef3f51d35e9154275da14e1f2c740b33';

/// See also [fetchPopularPersonUseCase].
@ProviderFor(fetchPopularPersonUseCase)
final fetchPopularPersonUseCaseProvider =
    AutoDisposeProvider<FetchPopularPersonUseCase>.internal(
  fetchPopularPersonUseCase,
  name: r'fetchPopularPersonUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchPopularPersonUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchPopularPersonUseCaseRef
    = AutoDisposeProviderRef<FetchPopularPersonUseCase>;
String _$favoriteMovieUseCaseHash() =>
    r'85b0fe68a95fc868c19af480442eaf81f708b3f6';

/// See also [favoriteMovieUseCase].
@ProviderFor(favoriteMovieUseCase)
final favoriteMovieUseCaseProvider =
    AutoDisposeProvider<FavoriteMovieUseCase>.internal(
  favoriteMovieUseCase,
  name: r'favoriteMovieUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteMovieUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoriteMovieUseCaseRef = AutoDisposeProviderRef<FavoriteMovieUseCase>;
String _$nowPlayingMoviesHash() => r'b6d97210a072caead0aa041ead1802854ec896d6';

/// page state
///
///
/// Copied from [nowPlayingMovies].
@ProviderFor(nowPlayingMovies)
final nowPlayingMoviesProvider =
    AutoDisposeStreamProvider<List<MovieVo>>.internal(
  nowPlayingMovies,
  name: r'nowPlayingMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nowPlayingMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NowPlayingMoviesRef = AutoDisposeStreamProviderRef<List<MovieVo>>;
String _$upComingMoviesHash() => r'5fde7dd0963b3ae29decb0e1dc542901e26c1cbd';

/// See also [upComingMovies].
@ProviderFor(upComingMovies)
final upComingMoviesProvider =
    AutoDisposeStreamProvider<List<MovieVo>>.internal(
  upComingMovies,
  name: r'upComingMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$upComingMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpComingMoviesRef = AutoDisposeStreamProviderRef<List<MovieVo>>;
String _$popularMoviesHash() => r'b9910df2193f64c19ccdf1f71d6e117c4843b647';

/// See also [popularMovies].
@ProviderFor(popularMovies)
final popularMoviesProvider = AutoDisposeStreamProvider<List<MovieVo>>.internal(
  popularMovies,
  name: r'popularMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$popularMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PopularMoviesRef = AutoDisposeStreamProviderRef<List<MovieVo>>;
String _$popularPersonsHash() => r'd372ca02493e1b1cc6ae7345e9ada6e4543c5674';

/// See also [popularPersons].
@ProviderFor(popularPersons)
final popularPersonsProvider =
    AutoDisposeStreamProvider<List<ActorVo>>.internal(
  popularPersons,
  name: r'popularPersonsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$popularPersonsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PopularPersonsRef = AutoDisposeStreamProviderRef<List<ActorVo>>;
String _$homeCarouselIndexHash() => r'c78a9aad2de1dc66e2073a0809dd3385ce115e55';

/// See also [HomeCarouselIndex].
@ProviderFor(HomeCarouselIndex)
final homeCarouselIndexProvider =
    AutoDisposeNotifierProvider<HomeCarouselIndex, int>.internal(
  HomeCarouselIndex.new,
  name: r'homeCarouselIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeCarouselIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeCarouselIndex = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
