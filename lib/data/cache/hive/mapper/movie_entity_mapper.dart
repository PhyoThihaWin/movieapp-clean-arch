import 'package:movieapp_clean_arch/base/mapper/unidirection_mapper.dart';
import 'package:movieapp_clean_arch/data/cache/hive/entities/movie_entity.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';

class MovieEntityMapper extends UnidirectionalMap<MovieVo, MovieEntity> {
  @override
  MovieEntity map(MovieVo item) {
    return MovieEntity(
      item.key,
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
