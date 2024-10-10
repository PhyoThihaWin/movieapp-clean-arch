// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'17429f26fea97fae6659e52e460c1ad9ddaaa921';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$movieApiServiceHash() => r'd1c4b1ab42756e9446b24a46dc30112ecb78cd67';

/// See also [movieApiService].
@ProviderFor(movieApiService)
final movieApiServiceProvider = AutoDisposeProvider<MovieApiService>.internal(
  movieApiService,
  name: r'movieApiServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$movieApiServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MovieApiServiceRef = AutoDisposeProviderRef<MovieApiService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
