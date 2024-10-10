import 'package:movieapp_clean_arch/data/local/datasource/app_config_datasource.dart';
import 'package:movieapp_clean_arch/data/local/hive/daos/actor_dao.dart';
import 'package:movieapp_clean_arch/data/local/hive/daos/impl/actor_dao_impl.dart';
import 'package:movieapp_clean_arch/data/local/hive/daos/movie_dao.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'hive/daos/impl/movie_dao_impl.dart';

part 'local_provider.g.dart';

@riverpod
MovieDao movieDao(MovieDaoRef ref) {
  return MovieDaoImpl();
}

@riverpod
ActorDao actorDao(ActorDaoRef ref) {
  return ActorDaoImpl();
}

@riverpod
AppConfigDatasource appConfigDatasource(AppConfigDatasourceRef ref) {
  return AppConfigDatasource();
}
