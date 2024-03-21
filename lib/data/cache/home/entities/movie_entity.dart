import 'package:hive/hive.dart';
import 'package:movieapp_clean_arch/data/cache/hive/hive_constants.dart';

part 'movie_entity.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_MOVIE, adapterName: "MovieEntityAdapter")
class MovieEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String overview;
  @HiveField(3)
  final String backdropPath;
  @HiveField(4)
  final String posterPath;
  @HiveField(5)
  final String releaseDate;
  @HiveField(6)
  final double voteAverage;
  @HiveField(7)
  final List<int> genreIds;

  @HiveField(8)
  bool isNowPlaying = false;

  @HiveField(9)
  bool isComingSoon = false;

  @HiveField(10)
  bool isPopular = false;

  MovieEntity(
      this.id,
      this.title,
      this.overview,
      this.backdropPath,
      this.posterPath,
      this.releaseDate,
      this.voteAverage,
      this.genreIds);
}
