import 'package:movieapp_clean_arch/base/mapper/unidirection_mapper.dart';
import 'package:movieapp_clean_arch/data/network/movie/response/popular_person_response.dart';
import 'package:movieapp_clean_arch/domain/models/actor_vo.dart';
import 'package:movieapp_clean_arch/utils/primitive_ext.dart';

import '../../apiclient/api_constants.dart';

class PopularPersonMapper
    extends UnidirectionalMap<PopularPersonResponse?, ActorVo> {
  @override
  ActorVo map(PopularPersonResponse? item) {
    return ActorVo(
        (item?.adult).orFalse(),
        (item?.gender).orZero(),
        (item?.id).orZero(),
        (item?.knownForDepartment).orEmpty(),
        (item?.name).orEmpty(),
        (item?.originalName).orEmpty(),
        (item?.popularity).orZero(),
        IMAGE_BASE_URL + (item?.profilePath).orEmpty());
  }
}
