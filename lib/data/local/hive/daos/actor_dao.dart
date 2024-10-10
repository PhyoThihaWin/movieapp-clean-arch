import 'package:movieapp_clean_arch/data/local/hive/entities/actor_entity.dart';

abstract class ActorDao {
  void saveAllActors(List<ActorEntity> actorList);
  Stream<List<ActorEntity>> getActors();
}
