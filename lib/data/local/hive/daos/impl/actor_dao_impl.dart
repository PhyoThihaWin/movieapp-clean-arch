import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieapp_clean_arch/data/local/hive/entities/actor_entity.dart';
import 'package:movieapp_clean_arch/data/local/hive/hive_constants.dart';
import 'package:movieapp_clean_arch/data/local/hive/daos/actor_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class ActorDaoImpl extends ActorDao {
  var actorBox = Hive.box<ActorEntity>(BOX_NAME_ACTOR);

  List<ActorEntity> getAllActors() {
    return actorBox.values.toList();
  }

  Stream<void> getAllActorsEventStream() {
    return actorBox.watch();
  }

  @override
  Stream<List<ActorEntity>> getActors() {
    return getAllActorsEventStream()
        .startWith(getAllActors())
        .map((event) => getAllActors());
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
