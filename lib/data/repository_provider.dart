import 'package:movieapp_clean_arch/data/local/local_provider.dart';
import 'package:movieapp_clean_arch/data/network/network_provider.dart';
import 'package:movieapp_clean_arch/data/repository/app_config_repository_impl.dart';
import 'package:movieapp_clean_arch/domain/repository/other/app_config_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/repository/home/movie_repository.dart';
import 'repository/movie_repository_impl.dart';

part 'repository_provider.g.dart';

@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) {
  return MovieRepositoryImpl(
    ref.read(movieApiServiceProvider),
    ref.read(movieDaoProvider),
    ref.read(actorDaoProvider),
  );
}

@riverpod
AppConfigRepository appConfigRepository(AppConfigRepositoryRef ref) {
  return AppConfigRepositoryImpl(ref.read(appConfigDatasourceProvider));
}
