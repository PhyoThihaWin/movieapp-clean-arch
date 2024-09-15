import 'package:movieapp_clean_arch/base/mapper/unidirection_mapper.dart';
import 'package:movieapp_clean_arch/data/cache/hive/entities/actor_entity.dart';
import 'package:movieapp_clean_arch/domain/models/actor_vo.dart';

import '../../../network/apiclient/api_constants.dart';

class ActorEntityMapper extends UnidirectionalMap<ActorVo, ActorEntity> {
  @override
  ActorEntity map(ActorVo item) {
    return ActorEntity(
        item.adult,
        item.gender,
        item.id,
        item.knownForDepartment,
        item.name,
        item.originalName,
        item.popularity,
        IMAGE_BASE_URL + item.profilePath);
  }
}
