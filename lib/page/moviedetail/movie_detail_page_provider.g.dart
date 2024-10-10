// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_page_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMovieDetailUsecaseHash() =>
    r'fce5ef25abbcc239636c02364be673971f65881e';

/// See also [getMovieDetailUsecase].
@ProviderFor(getMovieDetailUsecase)
final getMovieDetailUsecaseProvider =
    AutoDisposeProvider<GetMovieDetailUsecase>.internal(
  getMovieDetailUsecase,
  name: r'getMovieDetailUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getMovieDetailUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMovieDetailUsecaseRef
    = AutoDisposeProviderRef<GetMovieDetailUsecase>;
String _$getMovieDetailsHash() => r'651e611ec2ca074533637b59ebf46343eb63a79b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$GetMovieDetails
    extends BuildlessAutoDisposeAsyncNotifier<MovieDetailVo> {
  late final int movieId;

  FutureOr<MovieDetailVo> build(
    int movieId,
  );
}

/// See also [GetMovieDetails].
@ProviderFor(GetMovieDetails)
const getMovieDetailsProvider = GetMovieDetailsFamily();

/// See also [GetMovieDetails].
class GetMovieDetailsFamily extends Family<AsyncValue<MovieDetailVo>> {
  /// See also [GetMovieDetails].
  const GetMovieDetailsFamily();

  /// See also [GetMovieDetails].
  GetMovieDetailsProvider call(
    int movieId,
  ) {
    return GetMovieDetailsProvider(
      movieId,
    );
  }

  @override
  GetMovieDetailsProvider getProviderOverride(
    covariant GetMovieDetailsProvider provider,
  ) {
    return call(
      provider.movieId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getMovieDetailsProvider';
}

/// See also [GetMovieDetails].
class GetMovieDetailsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    GetMovieDetails, MovieDetailVo> {
  /// See also [GetMovieDetails].
  GetMovieDetailsProvider(
    int movieId,
  ) : this._internal(
          () => GetMovieDetails()..movieId = movieId,
          from: getMovieDetailsProvider,
          name: r'getMovieDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMovieDetailsHash,
          dependencies: GetMovieDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetMovieDetailsFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  GetMovieDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  FutureOr<MovieDetailVo> runNotifierBuild(
    covariant GetMovieDetails notifier,
  ) {
    return notifier.build(
      movieId,
    );
  }

  @override
  Override overrideWith(GetMovieDetails Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetMovieDetailsProvider._internal(
        () => create()..movieId = movieId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<GetMovieDetails, MovieDetailVo>
      createElement() {
    return _GetMovieDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMovieDetailsProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMovieDetailsRef on AutoDisposeAsyncNotifierProviderRef<MovieDetailVo> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _GetMovieDetailsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GetMovieDetails,
        MovieDetailVo> with GetMovieDetailsRef {
  _GetMovieDetailsProviderElement(super.provider);

  @override
  int get movieId => (origin as GetMovieDetailsProvider).movieId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
