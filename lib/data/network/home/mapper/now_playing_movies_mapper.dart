import 'package:dart_extensions/dart_extensions.dart';
import 'package:movieapp_clean_arch/base/mapper/unidirection_mapper.dart';
import 'package:movieapp_clean_arch/data/network/apiclient/api_constants.dart';
import 'package:movieapp_clean_arch/data/network/home/response/movie_response.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';
import 'package:uuid/uuid.dart';

class NowPlayingMoviesMapper
    extends UnidirectionalMap<MovieResponse?, MovieVo> {
  @override
  MovieVo map(MovieResponse? item) {
    return MovieVo(
        const Uuid().v1(),
        (item?.id).orZero,
        (item?.title).orEmpty,
        (item?.overview).orEmpty,
        IMAGE_BASE_URL + (item?.backdropPath).orEmpty,
        IMAGE_BASE_URL + (item?.posterPath).orEmpty,
        (item?.releaseDate).orEmpty,
        (item?.voteAverage).orZero,
        (item?.genreIds).orEmptyObject);
  }
}
