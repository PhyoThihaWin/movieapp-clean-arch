import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp_clean_arch/data/local/hive/entities/actor_entity.dart';
import 'package:movieapp_clean_arch/utils/primitive_ext.dart';

import '../../apiclient/api_constants.dart';

part 'popular_person_response.g.dart';

@JsonSerializable()
class PopularPersonResponse {
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
  @JsonKey(name: 'known_for')
  final List<KnownFor>? knownFor;

  const PopularPersonResponse({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.knownFor,
  });

  factory PopularPersonResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularPersonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularPersonResponseToJson(this);

  ActorEntity toActorEntity() => ActorEntity(
      adult.orFalse(),
      gender.orZero(),
      id.orZero(),
      knownForDepartment.orEmpty(),
      name.orEmpty(),
      originalName.orEmpty(),
      popularity.orZero(),
      IMAGE_BASE_URL + profilePath.orEmpty());
}

@JsonSerializable()
class KnownFor {
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final int? id;
  final String? name;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_name')
  final String? originalName;
  final String? overview;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  final double? popularity;
  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @JsonKey(name: 'origin_country')
  final List<String>? originCountry;

  const KnownFor({
    this.adult,
    this.backdropPath,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
  });

  factory KnownFor.fromJson(Map<String, dynamic> json) =>
      _$KnownForFromJson(json);

  Map<String, dynamic> toJson() => _$KnownForToJson(this);
}
