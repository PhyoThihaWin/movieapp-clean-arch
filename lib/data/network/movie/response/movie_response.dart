import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp_clean_arch/data/cache/hive/entities/movie_entity.dart';
import 'package:movieapp_clean_arch/data/network/apiclient/api_constants.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';
import '../../../../utils/primitive_ext.dart';

import 'package:uuid/uuid.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  final int? id;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final String? title;
  final bool? video;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  const MovieResponse({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);

  MovieEntity toMovieEntity() => MovieEntity(
        const Uuid().v1(),
        id.orZero(),
        title.orEmpty(),
        overview.orEmpty(),
        IMAGE_BASE_URL + backdropPath.orEmpty(),
        IMAGE_BASE_URL + posterPath.orEmpty(),
        releaseDate.orEmpty(),
        voteAverage.orZero(),
        genreIds.orEmptyObject(),
      );

  MovieVo toMovieVo(bool isFavorite) => MovieVo(
        const Uuid().v1(),
        id.orZero(),
        title.orEmpty(),
        overview.orEmpty(),
        IMAGE_BASE_URL + backdropPath.orEmpty(),
        IMAGE_BASE_URL + posterPath.orEmpty(),
        releaseDate.orEmpty(),
        voteAverage.orZero(),
        genreIds ?? [],
        isFavorite,
      );
}
