import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp_clean_arch/data/network/apiclient/api_constants.dart';
import 'package:movieapp_clean_arch/domain/models/actor_vo.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';

part 'movie_detail_credits_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDetailCreditsResponse {
  final int? id;
  final List<CastResponse?>? cast;
  final List<CastResponse?>? crew;

  MovieDetailCreditsResponse({
    this.id,
    this.cast,
    this.crew,
  });

  factory MovieDetailCreditsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailCreditsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailCreditsResponseToJson(this);

  List<ActorVo> getCasts() =>
      (cast.orEmptyObject().map((item) => item.toActorVo())).orEmpty();
  List<ActorVo> getCrews() =>
      (crew.orEmptyObject().map((item) => item.toActorVo())).orEmpty();
}

@JsonSerializable()
class CastResponse {
  final bool? adult;
  final int? gender;
  final int? id;
  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;
  final String? name;
  @JsonKey(name: 'original_name')
  final String? originalName;
  final double? popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @JsonKey(name: 'cast_id')
  final int? castId;
  final String? character;
  @JsonKey(name: 'credit_id')
  final String? creditId;
  final int? order;

  CastResponse({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  factory CastResponse.fromJson(Map<String, dynamic> json) =>
      _$CastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CastResponseToJson(this);

  ActorVo toActorVo() => ActorVo(
      adult.orFalse(),
      gender.orZero(),
      id.orZero(),
      knownForDepartment.orEmpty(),
      name.orEmpty(),
      originalName.orEmpty(),
      popularity.orZero(),
      IMAGE_BASE_URL + profilePath.orEmpty());
}
