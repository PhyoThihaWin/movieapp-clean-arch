// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_search_page_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchMoviesUsecaseHash() =>
    r'0d1e9f887615bcc2b260968c9376e4bcd21eff7e';

/// See also [searchMoviesUsecase].
@ProviderFor(searchMoviesUsecase)
final searchMoviesUsecaseProvider =
    AutoDisposeProvider<SearchMoviesUsecase>.internal(
  searchMoviesUsecase,
  name: r'searchMoviesUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchMoviesUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchMoviesUsecaseRef = AutoDisposeProviderRef<SearchMoviesUsecase>;
String _$searchQueryHash() => r'5c9b0ca7113f8d074a9d0bc9ece5c95ded26321d';

/// See also [SearchQuery].
@ProviderFor(SearchQuery)
final searchQueryProvider =
    AutoDisposeNotifierProvider<SearchQuery, String?>.internal(
  SearchQuery.new,
  name: r'searchQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchQuery = AutoDisposeNotifier<String?>;
String _$searchPagingMoviesHash() =>
    r'41b6dffab1e6b17e587554178d0aeec5b8e4d990';

/// See also [SearchPagingMovies].
@ProviderFor(SearchPagingMovies)
final searchPagingMoviesProvider =
    AutoDisposeNotifierProvider<SearchPagingMovies, void>.internal(
  SearchPagingMovies.new,
  name: r'searchPagingMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchPagingMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchPagingMovies = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
