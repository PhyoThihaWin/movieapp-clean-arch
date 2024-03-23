import 'package:movieapp_clean_arch/base/mapper/unidirection_mapper.dart';
import 'package:movieapp_clean_arch/data/cache/hive/entities/actor_entity.dart';
import 'package:movieapp_clean_arch/domain/entities/actor_vo.dart';

import '../../../network/apiclient/api_constants.dart';

class ActorVoMapper extends UnidirectionalMap<ActorEntity, ActorVo> {
  @override
  ActorVo map(ActorEntity item) {
    return ActorVo(
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
