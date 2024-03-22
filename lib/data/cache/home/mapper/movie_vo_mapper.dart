import 'package:movieapp_clean_arch/base/mapper/unidirection_mapper.dart';
import 'package:movieapp_clean_arch/data/cache/hive/entities/movie_entity.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';

class MovieVoMapper extends UnidirectionalMap<MovieEntity, MovieVo> {
  @override
  MovieVo map(MovieEntity item) {
    return MovieVo(
      item.id,
      item.title,
      item.overview,
      item.backdropPath,
      item.posterPath,
      item.releaseDate,
      item.voteAverage,
      item.genreIds,
    );
  }
}
