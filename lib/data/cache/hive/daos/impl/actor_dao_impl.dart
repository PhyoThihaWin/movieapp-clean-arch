import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieapp_clean_arch/data/cache/hive/entities/actor_entity.dart';
import 'package:movieapp_clean_arch/data/cache/hive/hive_constants.dart';
import 'package:movieapp_clean_arch/data/cache/hive/daos/actor_dao.dart';

class ActorDaoImpl extends ActorDao {
  var actorBox = Hive.box<ActorEntity>(BOX_NAME_ACTOR);

  List<ActorEntity> getAllActors() {
    return actorBox.values.toList();
  }

  @override
  Stream<void> getAllActorsEventStream() {
    return actorBox.watch();
  }

  @override
  List<ActorEntity> getActors() {
    return getAllActors();
  }

  @override
  void saveAllActors(List<ActorEntity> actorList) {
    var startingId = actorBox.length + 1;
    Map<int, ActorEntity> actors = {
      for (var element in actorList) startingId++: element
    };
    actorBox.putAll(actors);
  }
}
