import 'package:hive/hive.dart';
import 'package:movieapp_clean_arch/data/cache/hive/hive_constants.dart';

part 'movie_entity.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_MOVIE, adapterName: "MovieEntityAdapter")
class MovieEntity {
  @HiveField(0)
  String? key;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String overview;
  @HiveField(4)
  final String backdropPath;
  @HiveField(5)
  final String posterPath;
  @HiveField(6)
  final String releaseDate;
  @HiveField(7)
  final double voteAverage;
  @HiveField(8)
  final List<int> genreIds;

  @HiveField(9)
  bool isNowPlaying = false;
  @HiveField(10)
  bool isComingSoon = false;
  @HiveField(11)
  bool isPopular = false;

  @HiveField(12, defaultValue: false)
  bool isFavorite = false;

  MovieEntity(this.key, this.id, this.title, this.overview, this.backdropPath,
      this.posterPath, this.releaseDate, this.voteAverage, this.genreIds);

  @override
  String toString() {
    return "$title : ${key.toString()}";
  }
}
