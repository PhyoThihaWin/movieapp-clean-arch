// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_page_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getFavoriteMoviesUsecaseHash() =>
    r'59c1a73cd4f98db4247e124334cd3aacff8e28c2';

/// See also [getFavoriteMoviesUsecase].
@ProviderFor(getFavoriteMoviesUsecase)
final getFavoriteMoviesUsecaseProvider =
    AutoDisposeProvider<GetFavoriteMoviesUsecase>.internal(
  getFavoriteMoviesUsecase,
  name: r'getFavoriteMoviesUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getFavoriteMoviesUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetFavoriteMoviesUsecaseRef
    = AutoDisposeProviderRef<GetFavoriteMoviesUsecase>;
String _$favoriteMoviesHash() => r'1180c218dbd5a88a2d65e9b7eb13e82478549460';

/// See also [favoriteMovies].
@ProviderFor(favoriteMovies)
final favoriteMoviesProvider =
    AutoDisposeStreamProvider<List<MovieVo>>.internal(
  favoriteMovies,
  name: r'favoriteMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoriteMoviesRef = AutoDisposeStreamProviderRef<List<MovieVo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
