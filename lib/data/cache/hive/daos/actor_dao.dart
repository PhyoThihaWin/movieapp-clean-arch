import 'package:movieapp_clean_arch/data/cache/hive/entities/actor_entity.dart';

abstract class ActorDao {
  void saveAllActors(List<ActorEntity> actorList);

  Stream<void> getAllActorsEventStream();

  List<ActorEntity> getActors();
}
