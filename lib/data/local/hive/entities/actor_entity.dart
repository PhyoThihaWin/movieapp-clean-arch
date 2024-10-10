import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieapp_clean_arch/data/local/hive/hive_constants.dart';
import 'package:movieapp_clean_arch/domain/models/actor_vo.dart';

import '../../../network/apiclient/api_constants.dart';

part 'actor_entity.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_ACTOR, adapterName: "ActorEntityAdapter")
class ActorEntity {
  @HiveField(0)
  final bool adult;
  @HiveField(1)
  final int gender;
  @HiveField(2)
  final int id;
  @HiveField(3)
  final String knownForDepartment;
  @HiveField(4)
  final String name;
  @HiveField(5)
  final String originalName;
  @HiveField(6)
  final double popularity;
  @HiveField(7)
  final String profilePath;

  ActorEntity(this.adult, this.gender, this.id, this.knownForDepartment,
      this.name, this.originalName, this.popularity, this.profilePath);

  ActorVo toActorVo() => ActorVo(
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        IMAGE_BASE_URL + profilePath,
      );
}
